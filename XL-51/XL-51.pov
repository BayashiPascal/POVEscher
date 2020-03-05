#version 3.7;

// ------ Includes ------

// Rendering parameters

#declare nbQuarter = 4;
#declare lightIntensity = 1.0 / (nbQuarter * 3);

background { color rgb 1.0 }
#include "rad_def.inc"
global_settings {
   radiosity {
      Rad_Settings(Radiosity_Normal,off,off)
      error_bound 2.0
      count 300
   }
   assumed_gamma 1.0
}
#default {finish{ambient 0.}}

// Include the house of stairs

#include "houseofstairs.inc"

// ------ Camera ------

// Move the camera by epsilon to avoid aligning with the interstice between block
#declare posCamera = <widthRoom / 2, lengthRoom / 2, lengthRoom / 2> * scaleBlock + 0.1 * y + 0.1 * z;
#declare lookAt = <widthRoom / 2, 0, 0.25 * lengthRoom> * scaleBlock;

camera {
  cylinder 2
  angle 210
  location posCamera
  look_at lookAt
  right x * 3.8
  up y
}

// ------ Scene ------

object {
  HouseOfStairs
}
object { 
  Lights 
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
