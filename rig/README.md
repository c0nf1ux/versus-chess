# Sizing Rig

`rig.scad` generates the six role blanks (king, queen, bishop, knight, rook, pawn) from three parameters: table square size, base diameter, and king height. Every other height derives from king height via the Staunton ratios in [`docs/PROJECT-SPEC.md`](../docs/PROJECT-SPEC.md#piece-height-hierarchy).

Forking for a different table: change `table_square_mm` and `base_diameter_mm` at the top of `rig.scad` — nothing else needs to change.

**Status:** dimensions are locked (30mm base, 65mm king height — see [`docs/PROJECT-SPEC.md`](../docs/PROJECT-SPEC.md#locked-dimensions)), but the actual blank silhouette (`role_blank()`) is still a placeholder cylinder — see the TODO in the file.

Render a preview:
```
openscad -o preview.png --imgsize=1200,300 --render rig.scad
```

Licensed under [MIT](../LICENSE).
