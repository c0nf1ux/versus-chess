# Versus Chess

A parametric chess set architecture: one reusable OpenSCAD sizing rig, plus a rotating series of themed 32-piece matchups (X-Men vs Brotherhood, Overwatch vs Marvel Rivals, and more to come).

Built for playing real games against my son on our own table — not a display piece.

## How it works

The set splits into two layers so a new matchup is a re-skin, not a redesign from zero:

1. **Sizing rig** (`rig/`) — a parametric OpenSCAD model that takes your table's square size as input and outputs six correctly-proportioned "role blanks" (king, queen, bishop, knight, rook, pawn), using standard Staunton height ratios. Fork this, plug in your own table's measurements, and get a rig sized for your board — no need to touch the geometry logic.
2. **Character skins** (`matchups/`) — per-matchup rosters and sculpts conformed onto the role blanks from step 1. These are fixed, non-parametric sculpts, since character art doesn't scale the way dimensioned geometry does.
3. **Storage case** (`case/`) — a parametric tray template that takes the same rig parameters and generates a fitted case for whichever matchup you've built.

Full design rationale, measurements, and the "why" behind every default is in [`docs/PROJECT-SPEC.md`](docs/PROJECT-SPEC.md).

## Status

- [x] Table measured, base footprint constant locked (70mm/square, 30mm base diameter)
- [x] King height locked (65mm) — full height table in [`docs/PROJECT-SPEC.md`](docs/PROJECT-SPEC.md#locked-dimensions)
- [x] Matchup 1 roster complete (X-Men vs Brotherhood)
- [x] Matchup 2 roster complete (Overwatch vs Marvel Rivals)
- [ ] Role blank silhouette designed (`rig/rig.scad` has a placeholder cylinder pending the real profile)
- [ ] Matchup 1 sculpts
- [ ] Parametric storage case

This repo is a work in progress — dimensions are locked and the rig scaffolding exists, but the real blank silhouette and all sculpts are still ahead.

## Repo layout

```
docs/       full project spec (measurements, architecture, rationale)
rig/        parametric OpenSCAD sizing rig (dimensions locked, silhouette WIP)
case/       parametric storage case template (WIP)
matchups/   per-matchup rosters and sculpt files
```

## Licensing

This repo has two license scopes, since it mixes reusable tooling with characters I don't own:

- **Sizing rig and case template code** (`rig/`, `case/`, any `.scad` files) — [MIT](LICENSE). Fork it, remix it, use it commercially, build your own original character sets on top of it.
- **Character sculpts and matchup content** (`matchups/`) — [CC BY-NC-SA 4.0](LICENSE-SCULPTS.md). Fan art of characters owned by their respective publishers (Marvel, Blizzard, NetEase, etc.) — personal, non-commercial printing and remixing only, with credit. These were never for sale regardless of license.

## Print profile

0.4mm nozzle, 0.2mm layer height, 2 walls (more for gameplay pieces that see handling vs. display-only), 15% infill, PLA.
