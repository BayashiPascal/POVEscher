#include "colors.inc"

// Unit is one block

// Width of the room (left-right axis of the lithography)
#declare widthRoom = 25.0;
// Height of the room (top-bottom axis of the lithography)
#declare heightRoom = 102.0;

// Texture of the blocks
#declare texBlock = texture {
  pigment { color White }
}

// Camera definition
#declare posCamera = <0.0, 0.0, 0.0>;
#declare lookAt = <0.0, 0.25 * heightRoom, -0.5 * heightRoom>;
camera {
  ultra_wide_angle
  angle 180
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
    <-0.5 * widthRoom, -0.5 * heightRoom, -0.5 * heightRoom>
    <0.5 * widthRoom, 0.5 * heightRoom, 0.5 * heightRoom>
    scale 1.1
  }
  box {
    <-0.5 * widthRoom, -0.5 * heightRoom, -0.5 * heightRoom>
    <0.5 * widthRoom, 0.5 * heightRoom, 0.5 * heightRoom>
  }
  texture {
    texBlock
  } 
}

// Whole scene
object {
  HouseOfStairs
}
