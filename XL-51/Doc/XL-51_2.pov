#include "colors.inc"

// Unit is one block size

// Width of the room (left-right axis of the lithography)
#declare widthRoom = 25.0;
// Length of the room (top-bottom axis of the lithography)
#declare lengthRoom = 102.0;

// Scale of the blocks
#declare scaleBlock = <1.0, 0.5, 0.5>;

// Texture of the blocks
#declare texBlock = texture {
  pigment { color White }
}

// Camera definition
#declare posCamera = <0.0, 0.0, 0.0>;
#declare lookAt = <0.0, 0.2375 * lengthRoom, -0.5 * lengthRoom>;
camera {
  ultra_wide_angle
  angle 200
  location posCamera
  look_at lookAt
  right x
  up y
}

// Light source
light_source {
  posCamera
  color rgb 1.0
}

// House of stairs
#declare HouseOfStairs = difference {
  box { 
    -0.5, 0.5
    scale scaleBlock
    scale <widthRoom, lengthRoom, lengthRoom>
    scale 1.1
  }
  box {
    -0.5, 0.5
    scale scaleBlock
    scale <widthRoom, lengthRoom, lengthRoom>
  }
  texture {
    texBlock
  } 
}

// Whole scene
object {
  HouseOfStairs
}
