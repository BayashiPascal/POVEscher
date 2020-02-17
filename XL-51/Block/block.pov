#include "colors.inc"

// Unit is one block size

background { color rgb 1.0 }
plane {y, 0 pigment {color rgb 1.0}}

// Camera definition
#declare posCamera = <3.0, 3.0, 3.0>;
#declare lookAt = <0.5, 0.0, 0.5>;
camera {
  location posCamera
  look_at lookAt
}

// Light source
light_source {
  posCamera + x + y
  color rgb 1.0
}

#macro RandScaleBlock(c)
  (1.0 + (0.5 - rand(seedBlock)) * c)
#end

// Block
#declare seedBlock = seed(0);
#macro Block()
  superellipsoid {
    #declare BlockRoundness = 0.075;
    <BlockRoundness, BlockRoundness>
    texture {
      pigment {color rgb 0.75 * RandScaleBlock(0.5)}
      normal { bumps 0.25 scale .02 }
      finish { ambient 0.0 diffuse 1.0 }
    }
    scale 0.5 * RandScaleBlock(0.025)
  }
#end

#macro MakeWall(PosMin, PosMax)
  union {
    #declare wallX = PosMin.x;
    #while (wallX < PosMax.x)
      #declare wallY = PosMin.y;
      #while (wallY < PosMax.y)
        #declare wallZ = PosMin.z;
        #while (wallZ < PosMax.z)
          object {
            Block()
            translate <wallX + 0.5, wallY + 0.5, wallZ + 0.5>
          }
          #declare wallZ = wallZ + 1.0;
        #end
        #declare wallY = wallY + 1.0;
      #end
      #declare wallX = wallX + 1.0;
    #end
  }
#end

#declare Wall = MakeWall(<-2.0, 0.0, -2.0>, <2.0, 1.0, 2.0>);

object {
  Wall
}
