// ------ Includes ------

// Include the macros relative to blocks

#include "blocks.inc"

// ------ Scene elements' dimensions ------

// Unit is one block size

// Scale of one block

#declare scaleBlock = <1.0, 0.5, 0.5>;

// Measured platforms' and stairs' dimensions

#declare nbStairsA = 10;
#declare widthStairsA = 4;

#declare widthStairsB = 4;
#declare nbStairsB = 8;
#declare slopeFrontStairsB = 1;

#declare widthStairsC = 6;
#declare nbStairsC = 9;
#declare slopeUpStairsC = 1;
#declare slopeFrontStairsC = 1;

#declare nbStairsD = 12;
#declare widthStairsD = 6;
#declare slopeUpStairsD = 1;
#declare slopeFrontStairsD = 1;

#declare nbStairsE = 15;
#declare widthStairsE = 6;
#declare slopeUpStairsE = 1;
#declare slopeFrontStairsE = 1;

#declare widthPlatformC = 6;

#declare widthPlatformD = 4;

#declare widthDoorE = 19;
#declare heightDoorE = 18;

// Empirically deducted dimensions

#declare lengthPlatformC = 44;

// Deducted platforms' and stairs' dimensions

#declare widthRoom = widthPlatformD + nbStairsE + widthPlatformC;

#declare heightPlatformD = nbStairsD;
#declare lengthPlatformD = widthStairsD + widthStairsE;

#declare posStairsD = <
  widthPlatformD + nbStairsD,
  0,
  widthStairsE + widthStairsD / 2
>;

#declare posStairsE = <
  widthPlatformD,
  nbStairsD + 1,
  widthStairsE / 2
>;

#declare heightPlatformC = nbStairsD + nbStairsE;

#declare heightGapPlatformBPlatformC = heightDoorE + 6;

#declare posStairsA = <
    widthRoom - widthPlatformC, 
    heightPlatformC, 
    lengthPlatformC + widthStairsA / 2
>;

#declare widthPlatformB = widthStairsC + 2;
#declare heightPlatformB = lengthPlatformC + widthStairsA + 3;
#declare lengthPlatformB = heightPlatformC + nbStairsC + widthStairsB + 2 + 4;

#declare lengthRoom = heightPlatformB + heightPlatformC + heightGapPlatformBPlatformC + 2;

#declare posStairsC = <
    widthRoom - widthStairsC / 2, 
    heightPlatformC, 
    lengthPlatformC + widthStairsA
>;

#declare widthPlatformA = widthPlatformB + 2;
#declare lengthPlatformA = heightPlatformC + nbStairsC;
#declare heightPlatformA = lengthPlatformB;

#declare heightGapPlatformAPlatformB = 6;

#declare slopeUpStairsA = (heightPlatformA - heightPlatformC) / nbStairsA;
#declare slopeFrontStairsA = (widthRoom - widthPlatformA - widthPlatformC + 3) / nbStairsA;

#declare posStairsB = <
    widthPlatformA, 
    heightPlatformA, 
    lengthPlatformA - widthStairsB / 2 + 5
>;

#declare slopeUpStairsB = heightGapPlatformAPlatformB / nbStairsB;

// ------- Side walls definition -------

#declare SideWallRight = union {
  MakeWall(
    <
      -1, 
      0, 
      0
    >,
    <
      0, 
      (lengthRoom - 2) / 2, 
      (lengthRoom + 1) / 2
    >)
  scale scaleBlock
}

#declare SideWallUp = union {
  MakeWall(
    <
      0, 
      0, 
      -1
    >,
    <
      widthRoom, 
      (lengthRoom - 2) / 2, 
      0
    >)
  scale scaleBlock
}

#declare SideWallDown = union {
  MakeWall(
    <
      0, 
      -1, 
      0
    >,
    <
      widthRoom, 
      0,
      lengthRoom / 2 + 1
    >)
  scale scaleBlock
}

#declare SideWallLeft = union {
  MakeWall(
    <
      widthRoom, 
      0, 
      0
    >,
    <
      widthRoom + 1, 
      (lengthRoom - 2) / 2, 
      (lengthRoom + 1) / 2
    >)
  scale scaleBlock
}

#declare SideWalls = union {
  object { SideWallRight }
  object { SideWallUp }
  object { SideWallDown }
  object { SideWallLeft }
}

// ------- Platforms definition -------

#declare PlatformA = union {
  MakeWall(
    <
      0, 
      heightPlatformA, 
      -10
    >,
    <
      widthPlatformA, 
      heightPlatformA + 1, 
      lengthPlatformA
    >)
  MakeWall(
    <
      widthPlatformA - 4, 
      heightPlatformA, 
      lengthPlatformA
    >,
    <
      widthPlatformA, 
      heightPlatformA + 1, 
      lengthPlatformA + 4
    >)
  MakeWall(
    <
      0, 
      heightPlatformA, 
      lengthPlatformA
    >,
    <
      3, 
      heightPlatformA + 1, 
      lengthPlatformA + 4
    >)
  MakeWall(
    <
      0, 
      heightPlatformA, 
      lengthPlatformA + 4
    >,
    <
      widthPlatformA, 
      heightPlatformA + 1, 
      lengthPlatformA + 5
    >)
  MakeWall(
    <
      0, 
      heightPlatformA, 
      lengthPlatformA + 5
    >,
    <
      widthPlatformB, 
      heightPlatformA + 1, 
      lengthPlatformA + 8
    >)
  MakeWall(
    <
      0, 
      heightPlatformA, 
      lengthPlatformA + 8
    >,
    <
      widthPlatformB - 1, 
      heightPlatformA + 1, 
      lengthPlatformA + 12
    >)
  MakeWall(
    <
      0, 
      heightPlatformA, 
      lengthPlatformA + 12
    >,
    <
      widthPlatformB, 
      heightPlatformA + 1, 
      lengthPlatformA + 16
    >)
  scale scaleBlock
}

#declare PlatformB = union {
  MakeWall(
    <
      0, 
      0, 
      heightPlatformB
    >,
    <
      widthPlatformB, 
      lengthPlatformB, 
      heightPlatformB + 1
    >)
  scale scaleBlock
}

#declare PlatformC = union {
  MakeWall(
    <
      widthRoom - widthPlatformC, 
      heightPlatformC, 
      0
    >,
    <
      widthRoom, 
      heightPlatformC + 1, 
      lengthPlatformC
    >)
  MakeWall(
    <
      widthRoom - widthPlatformC, 
      heightPlatformC, 
      lengthPlatformC
    >,
    <
      widthRoom - 3, 
      heightPlatformC + 1, 
      lengthPlatformC + widthStairsA
    >)
  scale scaleBlock
}

#declare PlatformD = union {
  MakeWall(
    <
      -widthPlatformD, 
      heightPlatformD, 
      0
    >,
    <
      widthPlatformD, 
      heightPlatformD + 1, 
      lengthPlatformD
    >)
  scale scaleBlock
}

#declare Platforms = union {
  object { PlatformA }
  object { PlatformB }
  object { PlatformC }
  object { PlatformD }
}

// ------ Stairs definition ------

#declare StairsA = object { 
  MakeStairs(
     widthStairsA, 
     nbStairsA, 
     posStairsA, 
     y * slopeUpStairsA, 
     z, 
    -x * slopeFrontStairsA)
  scale scaleBlock
}

#declare StairsB = object {
  MakeStairs(
    widthStairsB, 
    nbStairsB, 
    posStairsB, 
    y * slopeUpStairsB, 
    z, 
    x * slopeFrontStairsB)
  scale scaleBlock
}

#declare StairsC = object {
  MakeStairs(
    widthStairsC, 
    nbStairsC, 
    posStairsC, 
    y * slopeUpStairsC, 
    x, 
    z * slopeFrontStairsC)
  scale scaleBlock
}

#declare StairsD = object {
  MakeStairs(
     widthStairsD, 
     nbStairsD, 
     posStairsD, 
     y * slopeUpStairsD, 
     z, 
    -x * slopeFrontStairsD)
  scale scaleBlock
}

#declare StairsE = object {
  MakeStairs(
    widthStairsE, 
    nbStairsE, 
    posStairsE, 
    y * slopeUpStairsE, 
    z, 
    x * slopeFrontStairsE)
  scale scaleBlock
}

#declare Stairs = union {
  object { StairsA }
  object { StairsB }
  object { StairsC }
  object { StairsD }
  object { StairsE }
  texture {pigment {color rgb 1.0}}
}

// ------ House of Stairs definition ------

#declare HouseOfStairs = union {

  // Loop on the four quarters of the house
  #declare iQuarter = 0;
  #declare nbQuarter = 4;
  #while (iQuarter < nbQuarter)
    union {

      // Elements of one quarter
      object { SideWalls }
      object { Platforms }
      object { Stairs }

      // Rotate the quarter along the horizontal axis
      translate <0, -lengthRoom / 2, -lengthRoom /2> * scaleBlock
      rotate x * 90.0 * iQuarter
      translate <0, lengthRoom / 2, lengthRoom /2> * scaleBlock

      // Apply the symmetry to the odd quarters
      #if (iQuarter = 1 | iQuarter = 3)
        scale <-1.0, 1.0, 1.0>
        translate widthRoom * x * scaleBlock
      #end
    }
    #declare iQuarter = iQuarter + 1;
  #end
}

// ------ Camera ------

#declare posCamera = <widthRoom / 2, lengthRoom / 2, lengthRoom / 2> * scaleBlock;
#declare lookAt = <widthRoom / 2, 0, 0.25 * lengthRoom> * scaleBlock;

camera {
  cylinder 2
  angle 210
  location posCamera
  look_at lookAt
  right x * 3.8
  up y
}

// ------ Light ------

light_source {
  posCamera
  color rgb 1.0
}

// ------ Scene ------

object {
  HouseOfStairs
}

// ------ Frame ------

#declare QuarterFrame = union {
  #local r = 0.1;
  cylinder {
    <0, 0, 0>,
    <widthRoom, 0, 0>,
    r
  }
  cylinder {
    <0, 0, 0>,
    <0, lengthRoom / 2, 0>,
    r
  }
  cylinder {
    <0, 0, 0>,
    <0, 0, lengthRoom / 2>,
    r
  }
  cylinder {
    <widthRoom, 0, 0>,
    <widthRoom, lengthRoom / 2, 0>,
    r
  }
  cylinder {
    <widthRoom, 0, 0>,
    <widthRoom, 0, lengthRoom / 2>,
    r
  }
  cylinder {
    <0, lengthRoom / 2, 0>,
    <widthRoom, lengthRoom / 2, 0>,
    r
  }
  cylinder {
    <0, 0, lengthRoom / 2>,
    <widthRoom, 0, lengthRoom / 2>,
    r
  }
  cylinder {
    <0, lengthRoom / 2, 0>,
    <0, lengthRoom / 2, lengthRoom / 2>,
    r
  }
  cylinder {
    <0, 0, lengthRoom / 2>,
    <0, lengthRoom / 2, lengthRoom / 2>,
    r
  }
  cylinder {
    <widthRoom, lengthRoom / 2, 0>,
    <widthRoom, lengthRoom / 2, lengthRoom / 2>,
    r
  }
  cylinder {
    <widthRoom, 0, lengthRoom / 2>,
    <widthRoom, lengthRoom / 2, lengthRoom / 2>,
    r
  }
  texture {pigment {color rgb x}}
  scale scaleBlock
}

//object { QuarterFrame }
