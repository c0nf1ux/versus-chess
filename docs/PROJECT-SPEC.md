# Project: "Versus" Chess Set Architecture

## Context
Playable chess table, standard rules, matches against his son. Goal is a recurring series of themed 32-piece sets built around a matchup (X-Men vs Brotherhood, Sith vs Jedi, Hufflepuff vs another house, Marvel vs Capcom, DC vs Marvel, etc.), for personal use, not for sale. The design goal is a reusable architecture so that after the first set, producing a new matchup is mostly re-skinning rather than redesigning from zero.

## Key Open Item: Base Footprint
Piece base diameter is set entirely by this specific table's square dimensions (roughly 40-45% of square width is the usual clearance rule so adjacent pieces don't touch). This is the single measurement the whole rig is built from, confirmed against this table only, not compared against or reconciled with any other print scale.

**Final measurement: 70mm (2.75in) per square**, confirmed via two independent reference objects in separate photos (credit card, fixed 85.6mm long edge; dollar bill, fixed 155.96mm long edge), both landing on the same value. At this square size:
- Max base diameter (40-45% clearance rule): ~28-32mm
- Proportionate king height (standard 2-2.2:1 Staunton height-to-base ratio): ~60-70mm

This is the final footprint constant for this build. Only remaining decision is where within the 60-70mm range to set king height, a design choice rather than a measurement question.

## Locked Dimensions

- **Base diameter: 30mm, uniform across all six roles.** Middle of the 28-32mm clearance range, ~43% of the 70mm square. One base size for every piece (rather than varying per role) keeps the sizing rig simpler and guarantees no board collisions regardless of role.
- **King height: 65mm.** Middle of the 60-70mm proportionate range.

Full derived height hierarchy (Staunton ratios above, applied to the 65mm king):

| Piece | Ratio | Height |
|---|---|---|
| King | 1.00 | 65mm |
| Queen | 0.90 | 58.5mm |
| Bishop | 0.80 | 52mm |
| Knight | 0.75 | 48.75mm |
| Rook | 0.70 | 45.5mm |
| Pawn | 0.60 | 39mm |

These are the concrete inputs to `rig/rig.scad` — one base diameter, six heights.

## Distribution Goal: Git Repo and Community Builds
This project is intended for eventual publishing (git repo, Bambu Makerworld community sharing), not just a personal one-off build. This changes the sizing rig from a fixed model into a parametric one:
- Square size, base clearance ratio, and king-height-to-base ratio should be exposed as top-level parameters (OpenSCAD is the natural fit for this) rather than hardcoded to this table's ~70mm measurement.
- Someone forking the repo should be able to plug in their own table's square size and regenerate a correctly-proportioned six-role sizing rig without touching the underlying geometry logic.
- Character skins (per matchup) remain fixed sculpts conformed to whatever the current parameters produce, since the sculpting work itself isn't meaningfully parametric, but the rig they sit on should be.
- Repo should include documentation of the parameters and the reasoning behind the default clearance/height ratios, so community forks understand what's safe to change versus what's load-bearing to playability.

## Piece Height Hierarchy
Use Staunton-convention height ratios rather than inventing proportions per set, so every future matchup inherits the same scale automatically:

| Piece | Ratio of king height |
|---|---|
| King | 1.00 |
| Queen | 0.90 |
| Bishop | 0.80 |
| Knight | 0.75 |
| Rook | 0.70 |
| Pawn | 0.60 |

Pick one king height once (constrained by the base footprint above and by print time/material budget for 16 pieces per side), and derive the rest.

## Two-Layer Architecture

### Layer 1: Sizing Rig (parametric, build once)
Six "role blanks," one per piece type, each a simple bounding form (capsule/cone) at the exact height and max base diameter for that role, per the ratio table above. This is a CAD job (OpenSCAD/FreeCAD), not a sculpting job: it is dimensioned, repeatable, and should never need to be rebuilt once the base footprint is confirmed.

### Layer 2: Character Skins (organic, per matchup)
For each matchup, character models (statues, action figure scans, or from-scratch sculpts using the same reference-driven Blender workflow as the Cloak project) get conformed onto the matching role blank: scaled and shrinkwrapped to fit inside that role's height/footprint envelope rather than resculpted at a new scale each time.

**Recognition approach: literal roster casting, no silhouette hinting required.** King and queen are singular per side, so they're trivially identified regardless of sculpt. Pawns are uniform within a side (only the back row composition varies), so eight identical pawn sculpts per side carry no ambiguity. That leaves rook and knight, and by the same logic bishop, as the roles with two copies per side, where the requirement is simply that the same character always maps to the same role within a given matchup (e.g., for a Marvel-side roster: Black Knight and Moon Knight always cast as the two knights; Devil Dinosaur and Fing Fang Foom always cast as the two rooks). Once that mapping is fixed for a set, recognition comes from knowing the roster, not from shape cues built into the sculpt. This removes the silhouette-preservation requirement entirely: character sculpts can be fully literal to the source character.

Note: bishop has the same two-copies-per-side duplicate count as rook and knight, so it likely needs the same fixed-roster treatment even though it wasn't named alongside rook/knight; confirm this is intentional before finalizing a roster.

## Per-Matchup Workflow
1. Assign each of the 32 pieces (16 per side) to a character from the matchup's roster; character-to-role assignment can carry narrative logic (e.g., Sith pawns as stormtroopers/droids, per the example already given) rather than 1:1 importance mapping.
2. Source references for each assigned character (reuse the reference-board approach from the Cloak project).
3. Sculpt or conform each character onto its role blank, respecting the height/footprint envelope from Layer 1 and the readability constraint above.
4. Batch-slice per side/color for consistent print settings across the set (see print profile note below).

## Storage Case System
Single parametric case template (OpenSCAD is the right tool here, same reasoning as the sizing rig, and the same parametric requirement applies given the publishing goal) with a small set of exposed variables per matchup: piece count (32 fixed), per-role height (from Layer 1), base diameter (from the footprint constant), and two-color grouping. A new matchup's case becomes a parameter change and re-render rather than a new design. Recommend a tray-insert style (slots sized to each role's base + height) over a single deep box, so pieces don't shift or chip in storage.

**Lid/latch hardware:** magnet closure is available as an option for the lid — a stock of 400 magnets across 4 different sizes is on hand, so the case template can include printed magnet pockets (sized to whichever of the 4 diameters fits the lid thickness) rather than needing a separate mechanical latch or hinge. This should also be exposed as a parameter (magnet diameter/depth, pocket count/placement) since it's hardware-driven, not fixed by the piece geometry.

## Print Profile
Reuse the same 15cm-statue-adjacent print settings established for the statue projects (0.4mm nozzle, 0.2mm layer height, 2 walls, 15% infill, PLA) as the default, adjusting wall count upward for pieces that will see frequent handling during actual games rather than display only, since gameplay pieces take more wear than a display statue.

## Matchup 1: X-Men vs Brotherhood — Roster Tracker
Board order for reference: Rook–Knight–Bishop–[Queen–King]–Bishop–Knight–Rook, mirrored per side.

| Role | X-Men | Brotherhood |
|---|---|---|
| King | Cyclops | Magneto |
| Queen | Jean Grey | Mystique |
| Bishop x2 | Gambit, Rogue | Scarlet Witch, Toad |
| Knight x2 | Nightcrawler, Wolverine | Sabretooth, Omega Red |
| Rook x2 | Colossus, Beast | Blob, Juggernaut |
| Pawn (x8, one sculpt reused) | Danger Room training dummy | Reprogrammed Sentinel |

**Revision note:** Bishop, Cable, Warpath, Polaris, and Quicksilver were swapped out after an automated web-search sourcing pass found no usable free/CC-licensed 3D model for any of them (see `matchups/xmen-vs-brotherhood/sources.md`) — all turned up paid-only or no results. Replacements were picked on two criteria: (1) a real sourceable model exists, and (2) the character's power/archetype naturally matches its board role rather than just its affiliation — e.g. Iceman's organic ice-armor form parallels Colossus's metal-skin "living armor" look for the second Rook, both visually reading as the fortress/tank archetype the role calls for. Scarlet Witch and Toad are actually founding Brotherhood of Evil Mutants members, an upgrade in lore-accuracy over Polaris/Quicksilver. Rogue's earliest history was as a Brotherhood villain before defecting, but her defining, universally-recognized association is X-Men — same judgment call already made for Mystique above.

Juggernaut was briefly swapped for Avalanche when automated search turned up nothing for him, but manual browsing on Cults3D found real free candidates search had missed — reverted back to Juggernaut, the correct archetype fit for Rook anyway. Blob himself still remains an open sourcing gap (automated search never found him; worth a manual Cults3D check too, same as Juggernaut).

**Second revision (license verification pass):** Actually checking licenses (not just "is it free") on the sourced candidates found that Jean Grey and Iceman's only options (both by the same creator, Volpy Gregor) are CC BY-NC-**ND** — No Derivatives, which blocks the resize-to-fit-role-height step entirely, not just redistribution. Iceman was swapped for **Beast** (strength/agility archetype, a looser thematic fit than the ice-armor parallel to Colossus, but a real popular character worth having in the roster regardless). Jean Grey has no replacement yet — Queen is the one role where a substitute would be a real loss (Cyclops/Jean Grey as King/Queen mirrors their in-universe marriage), so a last Cults3D lead is being manually checked before considering alternatives. Colossus's MakerWorld/MyMiniFactory candidates were also both non-repo-eligible (Standard License / dead link) — replaced with a real Thingiverse find (purakito, CC BY-NC). Sentinel's MakerWorld candidate was "MakerWorld Exclusive License" — replaced with two real CC BY Thingiverse options. Also worth noting for later: Kobarf (the creator behind the Colossus/Toad wargaming-miniature alternates) has a whole consistent-style X-Men/Marvel line, including Cyclops, Gambit, Juggernaut, and Quicksilver — worth checking first for any future roster gaps.

Roster complete. Full cast, both sides (Beast still pending final confirmation — its only found candidate is on a blocked platform):

X-Men: Cyclops, Jean Grey (pending replacement search), Gambit, Rogue, Nightcrawler, Wolverine, Colossus, Beast (pending license confirmation), Danger Room training dummy (x8, unsourced)
Brotherhood: Magneto, Mystique, Scarlet Witch, Toad, Sabretooth, Omega Red, Blob (unsourced), Juggernaut, reprogrammed Sentinel (x8) — Sentinel pawns should read as decayed/reprogrammed-by-Magneto at the paint/finishing stage, not a pristine sculpt

Sentinel chosen over Genoshan Magistrates for the pawn specifically because a giant blocky robot is visually distinct at a glance from the humanoid, person-scaled Danger Room dummy, whereas Magistrates (human-shaped armored soldiers) would have silhouette-overlapped with the X-Men pawn.

Casting rule adopted for this matchup: strict affiliation matters more than thematic fit alone. Mystique (led Brotherhood incarnations directly) replaced Emma Frost (X-Men/Hellfire home) for this reason, and Bastion was ruled out from the X-Men rook slot for the same reason despite a strong name/concept fit, since his most prominent arc casts him as one of the X-Men's most significant villains.

## Matchup 2 (Planned Next): Overwatch vs Marvel Rivals — Roster Tracker
Board order for reference: Rook–Knight–Bishop–[Queen–King]–Bishop–Knight–Rook, mirrored per side.

| Role | Overwatch | Marvel Rivals |
|---|---|---|
| King | Soldier: 76 | Black Panther |
| Queen | Ana Amari | Storm |
| Bishop x2 | Zenyatta, Genji | Punisher, Daredevil |
| Knight x2 | Reaper, Bastion | Moon Knight, Blade |
| Rook x2 | Roadhog, Reinhardt | Thing, Hulk |
| Pawn (x8, one sculpt reused) | training dummy (Overwatch version) | training dummy (Marvel Rivals version) |

Roster complete. Full cast, both sides:

Overwatch: Soldier: 76, Ana Amari, Zenyatta, Genji, Reaper, Bastion, Roadhog, Reinhardt, training dummy (x8)
Marvel Rivals: Black Panther, Storm, Punisher, Daredevil, Moon Knight, Blade, Thing, Hulk, training dummy (x8)

Black Panther and Storm chosen for king/queen on the strength of being literally married co-rulers of Wakanda in canon, the same "exact-title match" logic that made Selene work well for Brotherhood's queen. Bishops lean into a justice/judgment theme (Punisher, street-level enforcer; Daredevil, vigilante with an explicit Catholic-guilt religious thread) rather than the mystic-clergy theme used for Overwatch's Zenyatta/Genji pairing, which is fine since nothing requires a consistent bishop interpretation across matchups.

Note: this matchup is game-vs-game rather than faction-vs-faction, so the strict in-universe-affiliation rule adopted for X-Men vs Brotherhood does not directly apply here — any playable character from each respective game is fair game regardless of in-lore faction (e.g., Reaper's in-lore defection to Talon doesn't disqualify him from the "Overwatch" side, since the side is defined by the game roster, not the in-fiction organization).

## Immediate Next Actions
- [ ] Choose king height within the 60-70mm range
- [ ] Build the parametric six-piece sizing rig in OpenSCAD
- [ ] Build reference boards for Matchup 1's cast characters
- [ ] Draft the parametric storage case template
