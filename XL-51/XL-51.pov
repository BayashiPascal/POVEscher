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
  //pigment { color White }
  pigment { checker color rgb 0, color rgb 1 }
  scale scaleBlock
}

// Camera definition
#declare posCamera = <-0.5 * widthRoom + 10.0, 2.0, 2.5>;
#declare lookAt = <0.0, 0.2375 * lengthRoom, -0.5 * lengthRoom>;
camera {
  ultra_wide_angle
  angle 160
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
#declare HouseOfStairs = union {
  difference {
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
  }
  box {
    #declare widthPlatform = 10.0;
    #declare lengthPlatform = 50.0;
    #declare heightPlatform = 52.0;
    <-0.5 * widthRoom, 0.5 * lengthRoom, -0.5 * lengthRoom + heightPlatform>
    <-0.5 * widthRoom + widthPlatform, 0.5 * lengthRoom - lengthPlatform, -0.5 * lengthRoom + heightPlatform + 1.0>
    scale scaleBlock
  }
  texture {
    texBlock
  } 
}

// Whole scene
object {
  HouseOfStairs
}
