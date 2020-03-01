// ------ Includes ------

// Include the macros relative to blocks

#include "blocks.inc"

// Rendering parameters

background { color rgb 1.0 }
#include "rad_def.inc"
global_settings {
   radiosity {
      Rad_Settings(Radiosity_Normal,off,off)
      error_bound 2.0
      count 200 //100
   }
}
#default {finish{ambient 0.}}
#declare nbQuarter = 4;
declare lightIntensity = 1.0 / (nbQuarter * 3);

// ------ Scene elements' dimensions ------

// Unit is one block size

// Scale of one block

#declare scaleBlock = <1.0, 0.5, 0.5>;

// Measured platforms' and stairs' dimensions

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

#declare heightDoorA = 11;
#declare widthDoorA = 7;

#declare heightDoorB = 8;
#declare widthDoorB = 6;

#declare heightDoorC = 9;
#declare widthDoorC = 6;

#declare heightDoorD = 6;
#declare widthDoorD = 4;

#declare widthDoorE = 19;
#declare heightDoorE = 18;

#declare widthDoorG = 4;
#declare heightDoorG = 2;

// Empirically deducted or modified dimensions to correct
// inconsistencies

#declare lengthPlatformC = 44;
#declare nbStairsA = 12;

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
      (lengthRoom - 1) / 2, 
      3
    >)
  MakeWall(
    <
      -1, 
      0, 
      3
    >,
    <
      0, 
      heightPlatformD, 
      3 + widthDoorB
    >)
  MakeWall(
    <
      -1, 
      heightPlatformD + 1 + heightDoorB, 
      3
    >,
    <
      0, 
      (lengthRoom - 1) / 2, 
      3 + widthDoorB
    >)
  MakeWall(
    <
      -1, 
      0, 
      3 + widthDoorB
    >,
    <
      0, 
      (lengthRoom - 1) / 2, 
      (lengthRoom + 1) / 2
    >)
  scale scaleBlock
}

#declare SideWallUp = union {
  difference {
    MakeWall(
      <
        -1, 
        heightDoorA - 4, 
        -1
      >,
      <
        widthRoom, 
        (lengthRoom - 2) / 2 - 4, 
        0
      >)
    cylinder {
      <0, 0, -10>, <0, 0, 10>, 1
      scale <widthDoorA / 2, 4, 1>
      translate <
        widthRoom - 2 - widthDoorA / 2,
        heightDoorA - 4,
        0>
    }
  }
  MakeWall(
    <
      -1, 
      (lengthRoom - 2) / 2 - 4, 
      -1
    >,
    <
      3, 
      (lengthRoom - 2) / 2, 
      0
    >)
  MakeWall(
    <
      3 + widthDoorC, 
      (lengthRoom - 2) / 2 - 4, 
      -1
    >,
    <
      widthRoom + 1, 
      (lengthRoom - 2) / 2, 
      0
    >)
  MakeWall(
    <
      0, 
      0, 
      -1
    >,
    <
      widthRoom - 2 - widthDoorA, 
      heightDoorA - 4, 
      0
    >)
  MakeWall(
    <
      widthRoom - 2, 
      0, 
      -1
    >,
    <
      widthRoom + 1, 
      heightDoorA - 4, 
      0
    >)
  scale scaleBlock
}

#declare SideWallDown = union {
  MakeWall(
    <
      -1, 
      -1, 
      -lengthPlatformD * 2
    >,
    <
      3, 
      0,
      lengthRoom / 2 + 1
    >)
  difference {
    MakeWall(
      <
        3, 
        -1, 
        -lengthPlatformD * 2
      >,
      <
        3 + widthDoorD, 
        0,
        lengthRoom / 2 - heightDoorD + 2
      >)
    cylinder {
      <0, -10, 0> <0, 10, 0> 1
      scale <widthDoorD / 2, 1, 2>
      translate <
        3 + widthDoorD / 2, 
        0, 
        lengthRoom / 2 - heightDoorD + 2>
    }
  }
  MakeWall(
    <
      3, 
      -1, 
      lengthRoom / 2
    >,
    <
      3 + widthDoorD, 
      0,
      lengthRoom / 2 + 1
    >)
  MakeWall(
    <
      3 + widthDoorD, 
      -1, 
      -lengthPlatformD * 2
    >,
    <
      widthRoom - 3 - widthDoorC, 
      0,
      lengthRoom / 2 + 1
    >)
  difference {
    MakeWall(
      <
        widthRoom - 3 - widthDoorC, 
        -1, 
        -lengthPlatformD * 2
      >,
      <
        widthRoom - 3, 
        0,
        lengthRoom / 2 - (heightDoorC - 5) + 2
      >)
    cylinder {
      <0, -10, 0> <0, 10, 0> 1
      scale <widthDoorC / 2, 1, 2>
      translate <
        widthRoom - 3 - widthDoorC / 2, 
        0, 
        lengthRoom / 2 - (heightDoorC - 5) + 2>
    }
  }
  MakeWall(
    <
      widthRoom - 3, 
      -1, 
      -lengthPlatformD * 2
    >,
    <
      widthRoom + 1, 
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
      (lengthRoom - 1) / 2, 
      19
    >)
  MakeWall(
    <
      widthRoom, 
      0, 
      19
    >,
    <
      widthRoom + 1, 
      heightPlatformC, 
      19 + widthDoorE
    >)
  MakeWall(
    <
      widthRoom, 
      heightPlatformC + 1 + heightDoorE, 
      19
    >,
    <
      widthRoom + 1, 
      (lengthRoom - 1) / 2, 
      19 + widthDoorE
    >)
  MakeWall(
    <
      widthRoom + 1, 
      heightPlatformC + 1, 
      18
    >,
    <
      widthRoom + 6, 
      heightPlatformC + 1 + heightDoorE, 
      19
    >)
  MakeWall(
    <
      widthRoom + 1, 
      heightPlatformC + 1, 
      19 + widthDoorE
    >,
    <
      widthRoom + 6, 
      heightPlatformC + 1 + heightDoorE, 
      19 + widthDoorE + 1
    >)
  MakeWall(
    <
      widthRoom + 17, 
      heightPlatformC + 1, 
      19 - 8
    >,
    <
      widthRoom + 18, 
      heightPlatformC + 1 + heightDoorE, 
      19 + widthDoorE + 8
    >)
  MakeWall(
    <
      widthRoom, 
      0, 
      19 + widthDoorE
    >,
    <
      widthRoom + 1, 
      (lengthRoom - 1) / 2, 
      19 + widthDoorE + 6
    >)
  MakeWall(
    <
      widthRoom, 
      0, 
      19 + widthDoorE + 6
    >,
    <
      widthRoom + 1, 
      heightPlatformC + 1 - heightDoorG, 
      19 + widthDoorE + 6 + widthDoorG
    >)
  MakeWall(
    <
      widthRoom, 
      heightPlatformC + 1 + heightDoorG, 
      19 + widthDoorE + 6
    >,
    <
      widthRoom + 1, 
      (lengthRoom - 1) / 2, 
      19 + widthDoorE + 6 + widthDoorG
    >)
  MakeWall(
    <
      widthRoom + 1, 
      heightPlatformC + 1 - heightDoorG, 
      19 + widthDoorE + 5
    >,
    <
      widthRoom + 5, 
      heightPlatformC + 1 + heightDoorG, 
      19 + widthDoorE + 6
    >)
  MakeWall(
    <
      widthRoom + 1, 
      heightPlatformC + 1 - heightDoorG, 
      19 + widthDoorE + 6 + widthDoorG
    >,
    <
      widthRoom + 5, 
      heightPlatformC + 1 + heightDoorG, 
      19 + widthDoorE + 6 + widthDoorG + 1
    >)
  MakeWall(
    <
      widthRoom + 1, 
      heightPlatformC + 1 - heightDoorG - 1, 
      19 + widthDoorE + 6
    >,
    <
      widthRoom + 5, 
      heightPlatformC + 1 - heightDoorG, 
      19 + widthDoorE + 6 + widthDoorG
    >)
  MakeWall(
    <
      widthRoom, 
      0, 
      19 + widthDoorE + 6 + widthDoorG
    >,
    <
      widthRoom + 1, 
      (lengthRoom - 1) / 2, 
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
      -20
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
      lengthPlatformA + 2
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
      lengthPlatformA + 2
    >)
  difference {
    MakeWall(
      <
        0, 
        heightPlatformA, 
        lengthPlatformA + 2
      >,
      <
        widthPlatformA, 
        heightPlatformA + 1, 
        lengthPlatformA + 4
      >)
    cylinder {
      <0, -10, 0> <0, 10, 0>, 1
      scale <1.5, 1, 1>
      translate <4.5, heightPlatformA, lengthPlatformA + 2>
    }
  }
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
  MakeWall(
    <
      0, 
      heightPlatformA - widthStairsC / 2, 
      lengthPlatformA - 1
    >,
    <
      widthStairsC, 
      heightPlatformA, 
      lengthPlatformA
    >)
  object {
    Block()
    scale <1, 1, 0.5>
    translate <
      widthPlatformB - 0.5,
      heightPlatformA + 0.5,
      lengthPlatformA + 8.25>
  }
  object {
    Block()
    scale <1, 1, 0.5>
    translate <
      widthPlatformB - 0.5,
      heightPlatformA + 0.5,
      lengthPlatformA + 11.75>
  }
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
      -10
    >,
    <
      widthRoom + 30, 
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
  MakeWall(
    <
      widthRoom - 3, 
      heightPlatformC - 3, 
      lengthPlatformC + widthStairsA
    >,
    <
      widthRoom, 
      heightPlatformC, 
      lengthPlatformC + widthStairsA + 1
    >)
  scale scaleBlock
}

#declare PlatformD = union {
  MakeWall(
    <
      -widthPlatformD, 
      heightPlatformD, 
      -lengthPlatformD
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
     posStairsA - y * 0.6, 
     y * slopeUpStairsA * 1.03, 
     z, 
    -x * slopeFrontStairsA * 1.0)
  scale scaleBlock
}

#declare StairsB = object {
  MakeStairs(
    widthStairsB, 
    nbStairsB, 
    posStairsB + y * 0.25, 
    y * slopeUpStairsB * 0.97, 
    z, 
    x * slopeFrontStairsB * 1.02)
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
  #while (iQuarter < nbQuarter)
    union {

      // Elements of one quarter
      object { SideWalls }
      object { Platforms }
      object { Stairs }

      // Rotate the quarter along the horizontal axis
      translate <0, -lengthRoom / 2, -lengthRoom / 2> * scaleBlock
      rotate x * 90.0 * iQuarter
      translate <0, lengthRoom / 2, lengthRoom / 2> * scaleBlock

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

// Move the camera by epsilon to avoid aligning with the interstice between block
#declare posCamera = <widthRoom / 2, lengthRoom / 2, lengthRoom / 2> * scaleBlock + 0.1 * y + 0.1 * z;
#declare lookAt = <widthRoom / 2, 0, 0.25 * lengthRoom> * scaleBlock;

//#declare posCamera = (posStairsA - 3 + 3 * y) * scaleBlock;
//#declare lookAt = posStairsA * scaleBlock;

camera {
  cylinder 2
  angle 210
  location posCamera
  look_at lookAt
  right x * 3.8
  up y
}

// ------ Light ------

/*light_source {
  posCamera
  color rgb 1.0
}*/

#declare Lights = union {

  // Loop on the four quarters of the house
  #declare iQuarter = 0;
  #while (iQuarter < nbQuarter)

    // Lights
    light_source {
      <widthRoom - 2 - widthDoorA / 2 - 1, heightDoorA, -5>
      color rgb 1.0 * lightIntensity
      area_light <2, 0, 0> <0, 2, 0> 4, 4 adaptive 0 jitter

      // Rotate the quarter along the horizontal axis
      translate <0, -lengthRoom / 2, -lengthRoom / 2> * scaleBlock
      rotate x * 90.0 * iQuarter
      translate <0, lengthRoom / 2, lengthRoom / 2> * scaleBlock

      // Apply the symmetry to the odd quarters
      #if (iQuarter = 1 | iQuarter = 3)
        scale <-1.0, 1.0, 1.0>
        translate widthRoom * x * scaleBlock
      #end
      //scale scaleBlock
    }

    light_source {
      <-5, heightPlatformD + 1 + heightDoorB, 3 + widthDoorB / 2>
      color rgb 1.0 * lightIntensity
      area_light <0, 2, 0> <0, 0, 2> 4, 4 adaptive 0 jitter

      // Rotate the quarter along the horizontal axis
      translate <0, -lengthRoom / 2, -lengthRoom / 2> * scaleBlock
      rotate x * 90.0 * iQuarter
      translate <0, lengthRoom / 2, lengthRoom / 2> * scaleBlock

      // Apply the symmetry to the odd quarters
      #if (iQuarter = 1 | iQuarter = 3)
        scale <-1.0, 1.0, 1.0>
        translate widthRoom * x * scaleBlock
      #end
      //scale scaleBlock
    }

    light_source {
      <3 + widthDoorC / 2, heightPlatformA + 1 + heightDoorC, -5>
      color rgb 1.0 * lightIntensity
      area_light <2, 0, 0> <0, 2, 0> 4, 4 adaptive 0 jitter

      // Rotate the quarter along the horizontal axis
      translate <0, -lengthRoom / 2, -lengthRoom / 2> * scaleBlock
      rotate x * 90.0 * iQuarter
      translate <0, lengthRoom / 2, lengthRoom / 2> * scaleBlock

      // Apply the symmetry to the odd quarters
      #if (iQuarter = 1 | iQuarter = 3)
        scale <-1.0, 1.0, 1.0>
        translate widthRoom * x * scaleBlock
      #end
      //scale scaleBlock
    }

    light_source {
      <widthRoom + 2, heightPlatformC + 1 + heightDoorE - 1, 19 + widthDoorE / 2> * scaleBlock
      color rgb 1.0 * lightIntensity
      area_light <2, 0, 0> <0, 0, 2> 4, 4 adaptive 0 jitter

      // Rotate the quarter along the horizontal axis
      translate <0, -lengthRoom / 2, -lengthRoom / 2> * scaleBlock
      rotate x * 90.0 * iQuarter
      translate <0, lengthRoom / 2, lengthRoom / 2> * scaleBlock

      // Apply the symmetry to the odd quarters
      #if (iQuarter = 1 | iQuarter = 3)
        scale <-1.0, 1.0, 1.0>
        translate widthRoom * x * scaleBlock
      #end
      //scale scaleBlock
    }

    #declare iQuarter = iQuarter + 1;
  #end

  /*light_source {
    <widthRoom / 2, lengthRoom / 2, lengthRoom / 2>
    color rgb 0.1
  }*/

}

object { Lights }

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
