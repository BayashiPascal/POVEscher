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
#declare posCamera = <0.0, 0.0, 0.0>;
#declare lookAt = <0.0, 0.25 * lengthRoom, -0.5 * lengthRoom>;
camera {
  cylinder 2
  angle 210
  location posCamera
  look_at lookAt
  right x * 2.9
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

// Platforms
#declare PlatformA = difference {
  #declare widthPlatformA = 10.0;
  #declare lengthPlatformA = 50.0;
  #declare heightPlatformA = 43.0;
  box {
    <-0.5 * widthRoom, 0.5 * lengthRoom, -0.5 * lengthRoom + heightPlatformA>
    <-0.5 * widthRoom + widthPlatformA, 0.5 * lengthRoom - lengthPlatformA, -0.5 * lengthRoom + heightPlatformA + 1.0>
    scale scaleBlock
  }
  box {
    <-0.5 * widthRoom + widthPlatformA - 2, 0.5 * lengthRoom - lengthPlatformA + 11, -0.5 * lengthRoom + heightPlatformA - 0.1>
    <-0.5 * widthRoom + widthPlatformA + 1, 0.5 * lengthRoom - lengthPlatformA - 1, -0.5 * lengthRoom + heightPlatformA + 1.1>
    scale scaleBlock
  }
}

#declare PlatformB = box {
  #declare widthPlatformB = widthPlatformA - 2.0;
  #declare lengthPlatformB = heightPlatformA;
  #declare heightPlatformB = lengthPlatformA - 1.0;
  <-0.5 * widthRoom, -0.5 * lengthRoom + heightPlatformB, 0.5 * lengthRoom>
  <-0.5 * widthRoom + widthPlatformB, -0.5 * lengthRoom + heightPlatformB + 1.0, 0.5 * lengthRoom - lengthPlatformB>
  scale scaleBlock
}

#declare PlatformC = box {
  #declare widthPlatformC = 6.0;
  #declare lengthPlatformC = lengthPlatformA - 3.0;
  #declare heightPlatformC = heightPlatformA - 15.0;
  <0.5 * widthRoom, 0.5 * lengthRoom, -0.5 * lengthRoom + heightPlatformC>
  <0.5 * widthRoom - widthPlatformC, 0.5 * lengthRoom - lengthPlatformC, -0.5 * lengthRoom + heightPlatformC + 1.0>
  scale scaleBlock
}

// House of stairs
#declare HouseOfStairs = union {
  #declare iQuarter = 0;
  #while (iQuarter < 4)
    union {
      object { Walls }
      object { PlatformA }
      object { PlatformB }
      object { PlatformC }
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
