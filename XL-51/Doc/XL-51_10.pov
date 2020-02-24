// ------ Includes ------

// Include the macros relative to blocks

#include "blocks.inc"

// ------ Scene elements' dimensions ------

// Unit is one block size

// Scale of one block

#declare scaleBlock = <1.0, 0.5, 0.5>;

// Width of the room (left-right axis of the lithography)

#declare widthRoom = 25.0;

// Length of the room (top-bottom axis of the lithography)

#declare lengthRoom = 102.0;

// Platforms' dimensions

#declare widthPlatformA  = 10.0;
#declare lengthPlatformA = 50.0;
#declare heightPlatformA = 43.0;

#declare widthPlatformB  = widthPlatformA - 2.0;
#declare lengthPlatformB = heightPlatformA;
#declare heightPlatformB = lengthPlatformA - 1.0;

#declare widthPlatformC  = 6.0;
#declare lengthPlatformC = lengthPlatformA - 4.0;
#declare heightPlatformC = heightPlatformA - 15.0;

// Stairs' dimensions

#declare widthStairsA = 4;
#declare nbStairsA = 10;
#declare slopeUpStairsA = 
  (heightPlatformA - heightPlatformC - 1) / (nbStairsA - 1);
#declare slopeFrontStairsA = 
  (widthRoom - widthPlatformC - (widthPlatformA - 2.0)) / 
  (nbStairsA - 1);
#declare posStairsA = 
  <
     0.5 * widthRoom - widthPlatformC, 
     0.5 * lengthRoom - lengthPlatformC + 2.0, 
    -0.5 * lengthRoom + heightPlatformC - 0.5
  >;

#declare widthStairsB = 4;
#declare nbStairsB = 8;
#declare slopeUpStairsB = 
  2.0 * (heightPlatformB - heightPlatformA - 2) / (nbStairsB - 1);
#declare slopeFrontStairsB = 
  (widthRoom - widthPlatformB - widthPlatformA) / (nbStairsB - 1);
#declare posStairsB = 
  <
     0.5 * widthRoom - widthPlatformA, 
    -0.5 * lengthRoom + heightPlatformA, 
     0.5 * lengthRoom - lengthPlatformA - 15.0
  >;

#declare widthStairsC = 6;
#declare nbStairsC = 9;
#declare slopeUpStairsC = 
  (lengthPlatformA - 16.0 - heightPlatformC) / (nbStairsC - 1);
#declare slopeFrontStairsC = 
  (lengthRoom - (lengthPlatformC + heightPlatformA + 1.0)) / 
  (nbStairsC - 1);
#declare posStairsC = 
  <
     0.5 * widthRoom - 3.0, 
     0.5 * lengthRoom - lengthPlatformC, 
    -0.5 * lengthRoom + heightPlatformC + 0.25
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
     y * slopeUpStairsB, 
     z, 
    -x * slopeFrontStairsB)
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
  posCamera + 1.0
  color rgb 1.0
}

// ------ Scene ------

object {
  HouseOfStairs
}


