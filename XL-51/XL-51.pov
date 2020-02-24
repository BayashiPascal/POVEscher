// ------ Includes ------

// Include the macros relative to blocks

#include "blocks.inc"

// Placeholder TO BE REMOVED
#declare nothing = box {0,0}
#declare widthRoom = 25;
#declare lengthRoom = 100;

// ------ Scene elements' dimensions ------

// Unit is one block size

// Scale of one block

#declare scaleBlock = <1.0, 0.5, 0.5>;

// Measured platforms' and stairs' dimensions

// Deducted platforms' and stairs' dimensions

// ------- Side walls definition -------

#declare SideWallA = union {
  nothing
}

#declare SideWallB = union {
  nothing
}

#declare SideWallC = union {
  nothing
}

#declare SideWallD = union {
  nothing
}

#declare SideWalls = union {
  object { SideWallA }
  object { SideWallB }
  object { SideWallC }
  object { SideWallD }
}

// ------- Platforms definition -------

#declare PlatformA = union {
  nothing
}

#declare PlatformB = union {
  nothing
}

#declare PlatformC = union {
  nothing
}

#declare PlatformD = union {
  nothing
}

#declare Platforms = union {
  object { PlatformA }
  object { PlatformB }
  object { PlatformC }
  object { PlatformD }
}

// ------ Stairs definition ------

#declare StairsA = object { 
  nothing
}

#declare StairsB = object {
  nothing
}

#declare StairsC = object {
  nothing
}

#declare StairsD = object {
  nothing
}

#declare StairsE = object {
  nothing
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
  #declare nbQuarter = 1;
  #while (iQuarter < nbQuarter)
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
        translate widthRoom * x
      #end
    }
    #declare iQuarter = iQuarter + 1;
  #end
}

// ------ Camera ------

#declare posCamera = <widthRoom / 2, lengthRoom / 2, lengthRoom / 2>;
#declare lookAt = <widthRoom / 2, 3 / 4 * lengthRoom, 0>;

camera {
  cylinder 2
  angle 210
  location posCamera
  look_at lookAt
  right x * 3.0
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
