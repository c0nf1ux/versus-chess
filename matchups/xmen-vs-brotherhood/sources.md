# Matchup 1 — Sourced Model Candidates

Licenses below are **actually verified**, not guessed — via `scripts/check-license.sh` (MakerWorld, MyMiniFactory, Thingiverse — no browser needed) or manual relay for Printables/Cults3D (both run a real Cloudflare JS challenge that blocks all automated access, confirmed, no known workaround). Thingiverse verification requires a personal free `THINGIVERSE_TOKEN` — see the script header for one-time setup.

**Repo-eligible** = license allows redistributing a *modified* file (resizing counts as a modification): CC BY / BY-SA / BY-NC / BY-NC-SA. **Not eligible, ever, even for personal use in this project**: any "No Derivatives" (ND) variant — resizing to fit the role height is itself the blocked action. **Not eligible for the repo, but fine to print as-is for your own table**: MakerWorld's "Standard Digital File License" / "MakerWorld Exclusive License", CGTrader's "Royalty Free" license, Cults3D's default paid-tier terms, and anything with no stated license at all.

## X-Men

| Role | Character | Candidate | Verified license | Status |
|---|---|---|---|---|
| King | Cyclops | [monster_prey (Thingiverse)](https://www.thingiverse.com/thing:7044304) | CC BY-NC | ✅ Repo-eligible |
| Queen | Jean Grey | ~~[Volpy Gregor (MyMiniFactory)](https://www.myminifactory.com/object/3d-print-phoenix-jean-grey-x-men-124189)~~ | CC BY-NC-**ND** | ❌ Not usable at all (blocks resize). **Needs a new candidate.** |
| Bishop | Gambit *(replaces Bishop)* | [MakerWorld](https://makerworld.com/en/models/2843827-gambito-xmen) | Standard Digital File License | ❌ Not repo-eligible. [Printables alt](https://www.printables.com/model/997840-gambit-x-men) still unverified (blocked) |
| Bishop | Rogue *(replaces Cable)* | [MakerWorld](https://makerworld.com/en/models/3136938-rogue-x-men-fan-art) | Standard Digital File License | ❌ Not repo-eligible. Other MakerWorld/Printables alts still unverified (blocked) |
| Knight | Nightcrawler | [djvice (Printables)](https://www.printables.com/model/1570606-nightcrawler-x-men) | Unverified — Printables blocked | ⏳ Needs manual check |
| Knight | Wolverine | [Myke542 (Thingiverse)](https://www.thingiverse.com/thing:4193461) | CC BY | ✅ Repo-eligible. (Also valid: [h3xequy](https://www.thingiverse.com/thing:5365711) BY-NC-SA, [MustangDave](https://www.thingiverse.com/thing:267321) BY-NC. Original Wekster "Mini Logan" candidate was CC BY-NC-**ND** — dropped.) |
| Rook | Colossus | ~~[MyMiniFactory](https://www.myminifactory.com/object/3d-print-colossus-x-men-124831)~~ dead link (404); [MakerWorld](https://makerworld.com/en/models/791080-colossus) | Standard Digital File License | ❌ Not repo-eligible, and the alt is dead. **Needs a new candidate.** |
| Rook | Iceman *(replaces Warpath)* | ~~[Volpy Gregor (MyMiniFactory)](https://www.myminifactory.com/object/3d-print-iceman-x-men-128405)~~ | CC BY-NC-**ND** | ❌ Not usable at all (blocks resize). **Needs a new candidate.** |
| Pawn x8 | Danger Room training dummy | — | — | ⏳ Unresolved — only an oversized (407mm) diorama display piece has turned up, wrong purpose |

**Note:** Volpy Gregor's whole line (Jean Grey, Colossus, Iceman) is out — either ND-licensed or dead. The "one creator, consistent style" idea from earlier doesn't hold up; each of these three now needs an independent replacement.

## Brotherhood

| Role | Character | Candidate | Verified license | Status |
|---|---|---|---|---|
| King | Magneto | [AssetsFree.com](https://assetsfree.com/marvel-magneto-bust-free-3d-printable-stl-model/) | No license stated on page (just "free") | ❌ Not repo-eligible by default — no stated terms to claim redistribution rights |
| Queen | Mystique | [RyanTheMast (Cults3D)](https://cults3d.com/en/3d-model/art/ryanthemast-2) | Unverified — Cults3D blocked | ⏳ Needs manual check |
| Bishop | Scarlet Witch *(replaces Polaris)* | [ConcreteHead (Printables)](https://www.printables.com/model/68623-wanda-scarlet-witch-marvel) | Unverified — Printables blocked | ⏳ Needs manual check |
| Bishop | Toad *(replaces Quicksilver)* | [Kobarf (Thingiverse)](https://www.thingiverse.com/thing:4230179) | CC BY-NC-SA | ✅ Repo-eligible |
| Knight | Sabretooth | [Rober Rollin (MyMiniFactory)](https://www.myminifactory.com/object/3d-print-sabretooth-from-the-x-men-comics-105822) | No CC license found (likely paid tier) | ❌ Not repo-eligible |
| Knight | Omega Red | [Wicked/3dWicked (CGTrader)](https://www.cgtrader.com/free-3d-print-models/art/other/wicked-marvel-omega-red-bust) | CGTrader "Royalty Free" ($0.00, free:true confirmed) | ❌ Not repo-eligible — CGTrader's Royalty Free terms forbid redistributing the file itself. Fine to print as-is. |
| Rook | Blob | — | — | ⏳ Unresolved after 5 search attempts (see below) |
| Rook | Juggernaut | [customsculture](https://cults3d.com/en/3d-model/art/juggernaut-customsculture) or [Artaniss](https://cults3d.com/en/3d-model/game/juggernaut-artaniss) (Cults3D) | User-confirmed free; exact CC variant unverified — Cults3D blocked | ⏳ Needs manual check of the actual badge (not just price) |
| Pawn x8 | Reprogrammed Sentinel | [DUB DA GREAT (MakerWorld)](https://makerworld.com/en/models/2475206-sentinel-x-men) | MakerWorld Exclusive License | ❌ Not repo-eligible. **Needs a new candidate.** |

## Also considered and rejected for the Brotherhood Rook slot

Before finding real Juggernaut candidates via manual browsing, automated search turned up nothing for him, so alternates were considered: **Avalanche** (Cults3D free candidate found, but a weaker "wall" archetype fit), **Unus the Untouchable** (founding Brotherhood member, strong thematic fit, but no model exists anywhere searched), and **Frenzy/Joanna Cargill** (also no model found). All moot now that Juggernaut himself is confirmed findable.

## Automated verification tooling

`scripts/check-license.sh <url>` — checks MakerWorld and MyMiniFactory with no auth at all (they server-render license data into plain HTML), and Thingiverse via their official API (needs a one-time free `THINGIVERSE_TOKEN`, see script header). Printables and Cults3D run a genuine Cloudflare JS challenge with no known automated workaround — those need a human to open the page and relay back the actual license badge shown.

## Summary

- **Confirmed repo-eligible (3):** Cyclops, Wolverine, Toad.
- **Confirmed NOT usable at all, ND blocks resizing (2):** Jean Grey, Iceman — need replacements.
- **Confirmed not repo-eligible, personal-print-only (6):** Gambit, Rogue, Colossus, Magneto, Sabretooth, Omega Red, Sentinel — Colossus and Sentinel need full replacements since their only other candidates are dead/nonexistent; the rest may still have a repo-eligible alternative on Printables/Cults3D pending manual check.
- **Still unresolved, no candidate at all (2):** Danger Room training dummy, Blob.
- **Awaiting manual relay from a blocked platform (4):** Nightcrawler, Mystique, Scarlet Witch, Juggernaut.

## Next steps

1. Manually check the 4 "awaiting manual relay" links on Printables/Cults3D and report back the license badge shown.
2. Find real replacements for Jean Grey, Iceman, Colossus, and Sentinel — all four currently have zero repo-eligible options.
3. Once a character's license is confirmed repo-eligible, download it into `matchups/xmen-vs-brotherhood/raw/<character>.stl` (gitignored raw source, kept local) and use `import()` + `resize()` in a per-character `.scad` file to conform it to that role's height from `docs/PROJECT-SPEC.md`.
