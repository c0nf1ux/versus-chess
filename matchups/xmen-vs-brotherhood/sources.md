# Matchup 1 — Sourced Model Candidates

Found via web search, not yet manually verified. **Nobody's downloaded, license-checked, or committed anything yet** — this is a candidate list, one step before that. Printables and Thingiverse both blocked automated fetching (403/429), so exact license text (which CC variant, remix/redistribution terms) needs a human to open each link and check the badge before anything here gets used.

**Repo-eligible** = license, once actually confirmed, allows redistributing a modified file (CC BY / BY-SA / BY-NC / BY-NC-SA). Paid marketplace files (Cults3D premium, CGTrader, Gambody, Etsy) are print-only — their EULAs generally forbid redistributing the file even if you scale/modify it, so those never go in the repo regardless of what you find on the badge.

## X-Men

| Role | Character | Candidate | Platform | Cost | Repo-eligible? |
|---|---|---|---|---|---|
| King | Cyclops | [Cyclops FREE 3D Print model by monster_prey](https://www.thingiverse.com/thing:7044304) | Thingiverse | Free | Verify license on page |
| Queen | Jean Grey | [Phoenix - Jean Grey (X-men) by Volpy Gregor](https://www.myminifactory.com/object/3d-print-phoenix-jean-grey-x-men-124189) | MyMiniFactory | Free tier + paid tier | Verify which tier / license |
| Bishop | Bishop | [Bishop X-Men 97 by RomaCE](https://cults3d.com/en/3d-model/art/bishop-x-men-97) | Cults3D | Unconfirmed, likely paid | **No free candidate found** — check price/license on page |
| Bishop | Cable | [Wicked Marvel Cable 2025 Sculpture](https://3dwicked.gumroad.com/l/Cable2025S) | Gumroad | Paid | No — paid marketplace, print-only |
| Knight | Nightcrawler | [NIGHTCRAWLER X-MEN by djvice](https://www.printables.com/model/1570606-nightcrawler-x-men) | Printables | Free | Verify license on page |
| Knight | Wolverine | [Mini Logan - Wolverine by Wekster](https://www.printables.com/model/225-mini-logan-wolverine) (also on [Thingiverse](https://www.thingiverse.com/thing:2878103)) | Printables / Thingiverse | Free | Listed as "CC 4.0" — need exact variant (BY/BY-SA/BY-NC/etc.) |
| Rook | Colossus | [Colossus - X-men by Volpy Gregor](https://www.myminifactory.com/object/3d-print-colossus-x-men-124831) — same creator as Jean Grey above, worth checking for style consistency across the roster | MyMiniFactory | Free tier + paid tier | Verify which tier / license |
| Rook | Warpath | — | — | — | **No candidate found at all.** Obscure enough there's no dedicated fan model in this search pass. Needs a custom sculpt, a deeper/different search, or a roster substitution. |
| Pawn x8 | Danger Room training dummy | — | — | — | **No real match.** Only turned up an oversized (407mm) Danger Room diorama display piece, wrong purpose entirely. Needs a generic training-dummy/mannequin search or a custom sculpt. |

## Brotherhood

| Role | Character | Candidate | Platform | Cost | Repo-eligible? |
|---|---|---|---|---|---|
| King | Magneto | [Marvel Magneto Bust](https://assetsfree.com/marvel-magneto-bust-free-3d-printable-stl-model/) | AssetsFree.com | Free (claimed) | Unfamiliar site — verify legitimacy and license before trusting this one |
| Queen | Mystique | [Mystique X-men by RyanTheMast](https://cults3d.com/en/3d-model/art/ryanthemast-2) | Cults3D | Free | Verify license on page |
| Bishop | Polaris | — | — | — | **No free candidate found.** Sketchfab has a display model (not confirmed downloadable/printable); everything else found is paid. |
| Bishop | Quicksilver | — | — | — | Search surfaced only platform tag pages, no specific model — needs a follow-up search with different terms |
| Knight | Sabretooth | [Sabretooth from the X-Men Comics by Rober Rollin](https://www.myminifactory.com/object/3d-print-sabretooth-from-the-x-men-comics-105822) | MyMiniFactory | Unconfirmed | Verify price/license on page |
| Knight | Omega Red | [Wicked Marvel Omega Red Bust](https://www.cgtrader.com/free-3d-print-models/art/other/wicked-marvel-omega-red-bust) | CGTrader | Free (URL path says so) | Verify license on page |
| Rook | Blob | ~~[Blob by 3DPrintNovesia](https://makerworld.com/en/models/56075-blob)~~ | MakerWorld | Free | **False positive — flagging, don't use.** This is a scan of an actual amorphous blob object, not the X-Men character Fred Dukes. No real Blob-the-character model surfaced in this pass. |
| Rook | Juggernaut | — | — | — | Search only surfaced category/tag pages, no specific model link — needs a follow-up search |
| Pawn x8 | Reprogrammed Sentinel | [Sentinel (X-MEN) by DUB DA GREAT](https://makerworld.com/en/models/2475206-sentinel-x-men) | MakerWorld | Free | Verify license on page |

## Summary

- **Solid free candidates, pending license verification (8):** Cyclops, Jean Grey, Nightcrawler, Wolverine, Colossus, Mystique, Omega Red, Sentinel.
- **Found but paid-only, print-for-yourself-only (2):** Bishop, Cable.
- **Dead ends needing another pass or a substitution (5):** Warpath, Danger Room dummy, Polaris, Quicksilver, Juggernaut.
- **False positive to avoid (1):** Blob (MakerWorld model is not the character).
- **Needs a legitimacy check, not just a license check (1):** Magneto candidate is from a site I don't recognize.

## Next steps

1. Manually open each "verify license on page" link and record the exact license text here.
2. Re-search Warpath, Danger Room dummy, Polaris, Quicksilver, and Juggernaut with different search terms, or decide on substitutions/custom sculpts.
3. Once a character's license is confirmed repo-eligible, download it into `matchups/xmen-vs-brotherhood/raw/<character>.stl` (gitignored raw source, kept local) and use `import()` + `resize()` in a per-character `.scad` file to conform it to that role's height from `docs/PROJECT-SPEC.md`.
