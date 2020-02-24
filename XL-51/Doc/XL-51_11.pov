// ------ Includes ------

// Include the macros relative to blocks

#include "blocks.inc"

// ------ Scene elements' dimensions ------

// Unit is one block size

// Scale of one block

#declare scaleBlock = <1.0, 0.5, 0.5>;

// Measured platforms' and stairs' dimensions

#declare widthPlatformA = 10;

#declare lengthPlatformC = 46;
#declare widthPlatformC = 6;

#declare widthPlatformD = 4;

#declare widthGapPlatformAPlatformB = 7;
#declare heightGapPlatformAPlatformB = 6;
#declare heightGapPlatformBPlatformC = 24;

#declare widthStairsA = 4;
#declare nbStairsA = 10;

#declare widthStairsB = 4;
#declare nbStairsB = 8;

#declare nbStairsC = 12;
#declare widthStairsC = 6;
#declare slopeUpStairsC = 1.0;
#declare slopeFrontStairsC = 1.0;

#declare nbStairsD = 13;
#declare widthStairsD = 6;
#declare slopeUpStairsD = 1.0;
#declare slopeFrontStairsD = 1.0;

#declare nbStairsE = 15;
#declare widthStairsE = 6;
#declare slopeUpStairsE = 1.0;
#declare slopeFrontStairsE = 1.0;

// Deducted platforms' and stairs' dimensions

#declare heightPlatformC = nbStairsD + nbStairsE - 1;

#declare heightPlatformD = nbStairsD - 1;
#declare lengthPlatformD = widthStairsD + widthStairsE;

#declare widthRoom = // (right->left axis of the front wall)
  widthPlatformC + widthPlatformD + nbStairsE;

#declare lengthPlatformA = lengthPlatformC + 4;

#declare widthPlatformB = widthPlatformA - 2;
#declare heightPlatformB = 
  heightPlatformC + heightGapPlatformBPlatformC;

#declare heightPlatformA = 
  heightPlatformB - heightGapPlatformAPlatformB;

#declare lengthPlatformB = heightPlatformA;

#declare lengthRoom = // (bottom->top axis of the front wall)
  heightPlatformB + lengthPlatformA;

#declare posStairsA = 
  <
     0.5 * widthRoom - widthPlatformC,
     0.5 * lengthRoom - (lengthPlatformC - widthStairsA / 2),
    -0.5 * lengthRoom + heightPlatformC
  >;
#declare slopeFrontStairsA = 
  (widthRoom - widthPlatformC - widthPlatformB + 1) / nbStairsA;
#declare slopeUpStairsA = 
  (heightPlatformA - heightPlatformC) / nbStairsA;

#declare posStairsB = 
  <
    -0.5 * widthRoom + widthPlatformA,
     0.5 * lengthRoom - lengthPlatformA + 11 + widthStairsB / 2,
    -0.5 * lengthRoom + heightPlatformA
  >;
#declare slopeFrontStairsB = 
  (widthRoom - widthPlatformB - widthPlatformA) / nbStairsB;
#declare slopeUpStairsB =
  (heightGapPlatformAPlatformB) / nbStairsB;

#declare posStairsC = 
  <
     0.5 * widthRoom - widthStairsC / 2,
     0.5 * lengthRoom - lengthPlatformC,
    -0.5 * lengthRoom + heightPlatformC
  >;

#declare posStairsD = 
  <
     -0.5 * widthRoom + widthPlatformD + nbStairsD,
     0.5 * lengthRoom - lengthPlatformD + widthStairsD / 2,
    -0.5 * lengthRoom - 1 
      // -1 because the first stair is hidden in the wall
  >;

#declare posStairsE = 
  <
     -0.5 * widthRoom + widthPlatformD,
     0.5 * lengthRoom - widthStairsE / 2,
    -0.5 * lengthRoom + heightPlatformD
  >;

// ------- Side walls definition -------

#declare lengthRoomSideWall = lengthRoom + 1;

#declare SideWallA = union {
  MakeWall(
    <
      -0.5 * widthRoom - 1.0,
       0.0,
       -0.5 * lengthRoomSideWall
    >,
    <
      -0.5 * widthRoom,
       0.5 * lengthRoomSideWall,
       0.0
    >)
  scale scaleBlock
}

#declare SideWallB = union {
  MakeWall(
    <
      0.5 * widthRoom,
      0.0,
      -0.5 * lengthRoomSideWall
    >,
    <
      0.5 * widthRoom + 1.0,
      0.5 * lengthRoomSideWall,
      0.0
    >)
  scale scaleBlock
}

#declare SideWallC = union {
  MakeWall(
    <
      -0.5 * widthRoom,
       0.0,
       -0.5 * lengthRoomSideWall - 1.0
    >,
    <
      0.5 * widthRoom,
      0.5 * lengthRoomSideWall,
      -0.5 * lengthRoomSideWall
    >)
  scale scaleBlock
}

#declare SideWallD = union {
  MakeWall(
    <
      -0.5 * widthRoom,
       0.5 * lengthRoomSideWall,
      -0.5 * lengthRoomSideWall
    >,
    <
      0.5 * widthRoom,
      0.5 * lengthRoomSideWall + 1.0,
       0.0
    >)
  scale scaleBlock
}

#declare SideWalls = union {
  object { SideWallA }
  object { SideWallB }
  object { SideWallC }
  object { SideWallD }
}

// ------- Platforms definition -------

#declare PlatformA = union {
  MakeWall(
    <
      -0.5 * widthRoom, 
       0.5 * lengthRoom - lengthPlatformA + 11, 
      -0.5 * lengthRoom + heightPlatformA
    >,
    <
      -0.5 * widthRoom + widthPlatformA, 
       0.5 * lengthRoom, 
      -0.5 * lengthRoom + heightPlatformA + 1.0
    >)
  MakeWall(
    <
      -0.5 * widthRoom, 
       0.5 * lengthRoom - lengthPlatformA, 
      -0.5 * lengthRoom + heightPlatformA
    >,
    <
      -0.5 * widthRoom + widthPlatformA - 3, 
       0.5 * lengthRoom - lengthPlatformA + 11, 
      -0.5 * lengthRoom + heightPlatformA + 1.0
    >)


  MakeWall(
    <
      -0.5 * widthRoom + widthPlatformA - 3, 
       0.5 * lengthRoom - lengthPlatformA, 
      -0.5 * lengthRoom + heightPlatformA
    >,
    <
      -0.5 * widthRoom + widthPlatformA - 2, 
       0.5 * lengthRoom - lengthPlatformA + 4, 
      -0.5 * lengthRoom + heightPlatformA + 1.0
    >)
  MakeWall(
    <
      -0.5 * widthRoom + widthPlatformA - 3, 
       0.5 * lengthRoom - lengthPlatformA + 8, 
      -0.5 * lengthRoom + heightPlatformA
    >,
    <
      -0.5 * widthRoom + widthPlatformA - 2, 
       0.5 * lengthRoom - lengthPlatformA + 11, 
      -0.5 * lengthRoom + heightPlatformA + 1.0
    >)


  scale scaleBlock
}

#declare PlatformB = union {
  MakeWall(
    <
      -0.5 * widthRoom, 
      -0.5 * lengthRoom + heightPlatformB, 
       -0.5 * lengthRoom
    >,
    <
      -0.5 * widthRoom + widthPlatformB, 
      -0.5 * lengthRoom + heightPlatformB + 1.0, 
       -0.5 * lengthRoom + lengthPlatformB
    >)
  scale scaleBlock
}

#declare PlatformC = union {
  MakeWall(
    <
       0.5 * widthRoom - widthPlatformC, 
       0.5 * lengthRoom - lengthPlatformC, 
      -0.5 * lengthRoom + heightPlatformC
    >,
    <
       0.5 * widthRoom, 
       0.5 * lengthRoom, 
      -0.5 * lengthRoom + heightPlatformC + 1.0
    >)
  scale scaleBlock
}

#declare PlatformD = union {
  MakeWall(
    <
       -0.5 * widthRoom, 
       0.5 * lengthRoom - lengthPlatformD, 
      -0.5 * lengthRoom + heightPlatformD
    >,
    <
       -0.5 * widthRoom + widthPlatformD, 
       0.5 * lengthRoom, 
      -0.5 * lengthRoom + heightPlatformD + 1.0
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
     z * slopeUpStairsA, 
    -y, 
    -x * slopeFrontStairsA)
  scale scaleBlock
}

#declare StairsB = object {
  MakeStairs(
    widthStairsB, 
    nbStairsB, 
    posStairsB, 
    z * slopeUpStairsB, 
    y, 
    x * slopeFrontStairsB)
  scale scaleBlock
}

#declare StairsC = object {
  MakeStairs(
     widthStairsC, 
     nbStairsC, 
     posStairsC, 
     z * slopeUpStairsC, 
     x, 
    -y * slopeFrontStairsC)
  scale scaleBlock
}

#declare StairsD = object {
  MakeStairs(
    widthStairsD, 
    nbStairsD + 1, // +1 because the first stair is hidden in the wall 
    posStairsD, 
    z * slopeUpStairsD, 
    y, 
    -x * slopeFrontStairsD)
  scale scaleBlock
}

#declare StairsE = object {
  MakeStairs(
    widthStairsE, 
    nbStairsE, 
    posStairsE, 
    z * slopeUpStairsE, 
    y, 
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
  #while (iQuarter < 4)
    union {

      // Elements of one quarter
      object { SideWalls }
      object { Platforms }
      object { Stairs }

      // Rotate the quarter along the horizontal axis
      rotate x * 90.0 * iQuarter

      // Apply the symmetry to the odd quarters
      #if (iQuarter = 1 | iQuarter = 3)
        scale <-1.0, 1.0, 1.0>
      #end
    }
    #declare iQuarter = iQuarter + 1;
  #end
}

// ------ Camera ------

#declare posCamera = <0.0, 0.0, 0.0>;
#declare lookAt = <0.0, 0.2 * lengthRoom, -0.5 * lengthRoom>;

camera {
  cylinder 2
  angle 210
  location posCamera
  look_at lookAt
  right x * 3.3 //2.9
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



