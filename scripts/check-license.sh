#!/usr/bin/env bash
# Check the actual license on a sourced-model page, without a browser or API token.
#
# Works for: MakerWorld, MyMiniFactory (both server-render license data,
#   fetchable with a plain browser-UA curl request).
# Does NOT work for: Printables, Cults3D (real Cloudflare JS challenge —
#   no known workaround short of a real browser session). Thingiverse is
#   reachable but license data is client-side only; needs their API + a
#   token (see docs/PROJECT-SPEC.md sourcing notes).
#
# Usage: ./check-license.sh <model-url>

set -euo pipefail

URL="$1"
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36"
TMP=$(mktemp)
trap 'rm -f "$TMP"' EXIT

STATUS=$(curl -s -o "$TMP" -w "%{http_code}" -A "$UA" "$URL")

if [[ "$STATUS" == "403" ]] && grep -q "Just a moment" "$TMP"; then
  echo "BLOCKED: $URL is behind a Cloudflare JS challenge — this script can't read it. Check manually in a browser."
  exit 1
fi

if [[ "$STATUS" == "404" ]]; then
  echo "DEAD LINK (404): $URL"
  exit 1
fi

case "$URL" in
  *makerworld.com*)
    MODEL_ID=$(echo "$URL" | grep -o '/models/[0-9]*' | grep -o '[0-9]*')
    LICENSE=$(python -c "
import re, sys
html = open(r'$(cygpath -w "$TMP")', encoding='utf-8', errors='ignore').read()
ds = html.find('\"design\":{\"id\":$MODEL_ID')
if ds == -1:
    sys.exit(1)
m = re.search(r'\"license\":\"[^\"]*\"', html[ds:ds+80000])
print(m.group(0) if m else '', end='')
")
    if [[ -z "$LICENSE" ]]; then
      echo "UNKNOWN: could not find a license field for model id $MODEL_ID at $URL"
      exit 1
    fi
    echo "MakerWorld $LICENSE"
    if [[ "$LICENSE" == *"Standard Digital File License"* || "$LICENSE" == *"Exclusive"* ]]; then
      echo "-> NOT repo-eligible (personal print only, no redistribution/remix)"
    fi
    ;;
  *myminifactory.com*)
    CC=$(grep -o 'creativecommons\.org/licenses/[a-z-]*' "$TMP" | head -1)
    if [[ -z "$CC" ]]; then
      echo "UNKNOWN: no Creative Commons license link found at $URL (may be a paid/restricted model)"
      exit 1
    fi
    VARIANT=$(echo "$CC" | grep -o '[a-z-]*$')
    echo "MyMiniFactory CC $VARIANT"
    if [[ "$VARIANT" == *"nd"* ]]; then
      echo "-> NOT usable at all — No-Derivatives forbids resizing, even for personal use in this project"
    elif [[ "$VARIANT" == *"nc"* || "$VARIANT" == *"by"* ]]; then
      echo "-> Likely repo-eligible (verify no other restriction on the page)"
    fi
    ;;
  *)
    echo "UNSUPPORTED platform for automated checking: $URL"
    echo "Printables and Cults3D block automated access entirely — check manually."
    exit 1
    ;;
esac
