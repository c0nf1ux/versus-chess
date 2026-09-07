// Versus Chess — Layer 1: Parametric Sizing Rig
//
// Forking for your own table? Change table_square_mm and base_diameter_mm
// below (see docs/PROJECT-SPEC.md for the 40-45% clearance rule these come
// from) and every role blank re-derives automatically. Nothing below the
// parameters block should need to change for a different table.

table_square_mm  = 70;   // this table's measured square width
base_diameter_mm = 30;   // uniform across all roles — see docs/PROJECT-SPEC.md
king_height_mm   = 65;   // the one number every other height derives from

// Staunton-convention height ratios (docs/PROJECT-SPEC.md, "Piece Height Hierarchy")
role_ratios = [
  ["king",   1.00],
  ["queen",  0.90],
  ["bishop", 0.80],
  ["knight", 0.75],
  ["rook",   0.70],
  ["pawn",   0.60],
];

function role_height(ratio) = king_height_mm * ratio;

// ---------------------------------------------------------------------
// TODO(you): role_blank(height, base_diameter) — the silhouette profile.
//
// This is the one real design decision left in Layer 1: what shape does
// a "blank" actually take before a character skin gets conformed onto it?
// The spec calls for "a simple bounding form (capsule/cone)" but doesn't
// pick one — that's deliberately left for you.
//
// Trade-offs to weigh:
//   - Straight cone (base -> narrower top): simplest, prints with zero
//     overhangs, but the least characterful silhouette to sculpt onto.
//   - Capsule (cylinder + hemisphere cap): more universally Staunton-like,
//     rounded top reads as a "head" mount point for character conforming.
//   - Waisted/stepped profile (narrower mid-section, flared base+shoulder):
//     most convention-accurate Staunton look, but check overhang angles —
//     anything steeper than ~45 deg from vertical will droop without
//     supports at 0.2mm layer height.
//
// Whatever you pick, keep the base at full base_diameter (that's the
// board-collision guarantee) and the overall height exactly `height` —
// those two numbers are load-bearing for every other file in this repo.
//
// Signature to implement:
module role_blank(height, base_diameter) {
  // Replace this placeholder with your actual profile.
  cylinder(h=height, d1=base_diameter, d2=base_diameter, $fn=64);
}
// ---------------------------------------------------------------------

// Demo: lay out all six roles left-to-right for a quick render/preview.
spacing = base_diameter_mm + 10;
for (i = [0 : len(role_ratios)-1]) {
  role = role_ratios[i];
  translate([i * spacing, 0, 0])
    role_blank(role_height(role[1]), base_diameter_mm);
}
