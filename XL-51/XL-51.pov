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
  pigment { checker color rgb 0, color rgb 1 }
  translate 0.5*x
  scale scaleBlock
}

// Camera definition
#declare posCamera = <0.0, 0.0, 0.5>;
#declare lookAt = <0.0, 0.25 * lengthRoom, -0.5 * lengthRoom>;
camera {
  cylinder 2
  angle 200
  location posCamera
  look_at lookAt
  right x * 3.0
  up y
}

// Light source
light_source {
  posCamera
  color rgb 1.0
}

// Walls
#declare Walls = intersection {
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
    <-0.5, 0.0, 0.0>, 0.5
    scale scaleBlock
    scale <widthRoom, lengthRoom, lengthRoom>
  }
}

// Platform
#declare Platform = difference {
  #declare widthPlatform = 10.0;
  #declare lengthPlatform = 50.0;
  #declare heightPlatform = 43.0;
  box {
    <-0.5 * widthRoom, 0.5 * lengthRoom, -0.5 * lengthRoom + heightPlatform>
    <-0.5 * widthRoom + widthPlatform, 0.5 * lengthRoom - lengthPlatform, -0.5 * lengthRoom + heightPlatform + 1.0>
    scale scaleBlock
  }
  box {
    <-0.5 * widthRoom + widthPlatform - 2, 0.5 * lengthRoom - lengthPlatform + 11, -0.5 * lengthRoom + heightPlatform - 0.1>
    <-0.5 * widthRoom + widthPlatform + 1, 0.5 * lengthRoom - lengthPlatform - 1, -0.5 * lengthRoom + heightPlatform + 1.1>
    scale scaleBlock
  }
}

// House of stairs
#declare HouseOfStairs = union {
  #declare iQuarter = 0;
  #while (iQuarter < 4)
    union {
      object { Walls }
      object { Platform }
      rotate x * 90.0 * iQuarter
      #if (iQuarter = 1 | iQuarter = 3)
        scale <-1.0, 1.0, 1.0>
      #end
    }
    #declare iQuarter = iQuarter + 1;
  #end
  texture {
    texBlock
  } 
}

// Whole scene
object {
  HouseOfStairs
}
