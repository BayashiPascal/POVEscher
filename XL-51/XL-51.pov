// ------ Includes ------

// Include the macros relative to blocks

#include "blocks.inc"

// ------ Scene elements' dimensions ------

// Unit is one block size

// Scale of one block

#declare scaleBlock = <1.0, 0.5, 0.5>;

// Measured platforms' and stairs' dimensions

#declare lengthPlatformC = 46; // OK

#declare widthStairsA = 4; // OK
#declare nbStairsA = 10; // OK

#declare widthStairsB = 4; // OK
#declare nbStairsB = 8; // OK

#declare widthStairsC = 6; // OK
#declare nbStairsC = 9; // OK

#declare widthGapPlatformAPlatformB = 7; // OK
#declare heightGapPlatformAPlatformB = 7; // OK

#declare slopeUpStairsC = 1.0; // OK
#declare slopeFrontStairsC = 1.0; // OK



// Unknown


#declare lengthRoom = // (bottom->top axis of the front wall)
  96; // OK













// Deducted platforms' and stairs' dimensions

#declare widthPlatformA = widthStairsC + 4; // OK
#declare lengthPlatformA = lengthPlatformC + 4; // OK
#declare heightPlatformA = lengthRoom - lengthPlatformC - nbStairsC; // OK

#declare widthPlatformB = widthPlatformA - 2; // OK
#declare lengthPlatformB = heightPlatformA; // OK
#declare heightPlatformB = lengthRoom - lengthPlatformA + 3; // OK

#declare widthPlatformC = widthStairsC; // OK
#declare heightPlatformC = heightPlatformA - 15; // OK

#declare widthRoom = // (right->left axis of the front wall)
  widthPlatformA + widthPlatformB + widthGapPlatformAPlatformB; // OK

#declare posStairsA = 
  <
     0.5 * widthRoom - widthPlatformC, // OK
     0.5 * lengthRoom - (lengthPlatformC - widthStairsA / 2), // OK
    -0.5 * lengthRoom + heightPlatformC // OK
  >;
#declare slopeFrontStairsA = 
  (widthRoom - widthPlatformC - widthPlatformB + 1) / nbStairsA; // OK
#declare slopeUpStairsA = 
  (heightPlatformA - heightPlatformC) / nbStairsA;

#declare posStairsB = 
  <
    -0.5 * widthRoom + widthPlatformA, // OK
     0.5 * lengthRoom - lengthPlatformA + 11 + widthStairsB / 2, // OK
    -0.5 * lengthRoom + heightPlatformA // OK
  >;
#declare slopeFrontStairsB = 
  (widthRoom - widthPlatformB - widthPlatformA) / nbStairsB; // OK
#declare slopeUpStairsB =
  (heightGapPlatformAPlatformB - 2) / nbStairsB;

#declare posStairsC = 
  <
     0.5 * widthRoom - widthStairsC / 2, // OK
     0.5 * lengthRoom - lengthPlatformC, // OK
    -0.5 * lengthRoom + heightPlatformC // OK
  >;

// ------- Side walls definition -------

#declare SideWallA = union {
  MakeWall(
    <
      -0.5 * widthRoom - 1.0,
       0.0,
       0.0
    >,
    <
      -0.5 * widthRoom,
       0.5 * lengthRoom,
       0.5 * lengthRoom
    >)
  scale scaleBlock
}

#declare SideWallB = union {
  MakeWall(
    <
      0.5 * widthRoom,
      0.0,
      0.0
    >,
    <
      0.5 * widthRoom + 1.0,
      0.5 * lengthRoom,
      0.5 * lengthRoom
    >)
  scale scaleBlock
}

#declare SideWallC = union {
  MakeWall(
    <
      -0.5 * widthRoom,
       0.0,
       0.5 * lengthRoom
    >,
    <
      0.5 * widthRoom,
      0.5 * lengthRoom,
      0.5 * lengthRoom + 1.0
    >)
  scale scaleBlock
}

#declare SideWallD = union {
  MakeWall(
    <
      -0.5 * widthRoom,
       0.5 * lengthRoom,
       0.0
    >,
    <
      0.5 * widthRoom,
      0.5 * lengthRoom + 1.0,
      0.5 * lengthRoom
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
       0.5 * lengthRoom - lengthPlatformB
    >,
    <
      -0.5 * widthRoom + widthPlatformB, 
      -0.5 * lengthRoom + heightPlatformB + 1.0, 
       0.5 * lengthRoom
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

#declare Platforms = union {
  object { PlatformA }
  object { PlatformB }
  object { PlatformC }
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

#declare Stairs = union {
  object { StairsA }
  object { StairsB }
  object { StairsC }
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
#declare lookAt = <0.0, 0.25 * lengthRoom, -0.5 * lengthRoom>;

camera {
  cylinder 2
  angle 210
  location posCamera
  look_at lookAt
  right x * 2.9
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



