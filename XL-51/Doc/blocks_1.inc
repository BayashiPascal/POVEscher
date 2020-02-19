// Seed for the randomization of blocks' texture and size

#declare seedBlock = seed(0);

// Return a random value in range [1.0 - r / 2, 1.0 + r / 2]

#macro RandAroungOne(r)
  (1.0 + (0.5 - rand(seedBlock)) * r)
#end

// Return one block 

#macro Block()
  #local blockRoundness = 0.075;
  superellipsoid {
    <blockRoundness, blockRoundness>
    texture {
      pigment {color rgb 0.75 * RandAroungOne(0.5)}
      normal { bumps 0.25 scale .02 }
      finish { ambient 0.0 diffuse 1.0 }
    }
    scale 0.5 * RandAroungOne(0.025)
  }
#end

// Make the wall equivalent to box {posMin, posMax} made of blocks

#macro MakeWall(
    posMin, 
    posMax)
  union {
    #local wallX = posMin.x;
    #while (wallX < posMax.x)
      #local wallY = posMin.y;
      #while (wallY < posMax.y)
        #local wallZ = posMin.z;
        #while (wallZ < posMax.z)
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

// Return one stair
#macro MakeStairs(
    widthStair, 
    nbStair, 
    startPos, 
    upVec, 
    rightVec, 
    frontVec) 
  union {
    #local oneStairBottom = 
      -0.5 * widthStair * rightVec + 2.0 / 3.0 * vnormalize(upVec);
    #local oneStairTop = 
      0.5 * widthStair * rightVec + vnormalize(upVec) + frontVec;
    #local iStair = 0;
    #while (iStair < nbStair)
      box {
        oneStairBottom
        oneStairTop
        translate (frontVec + upVec) * iStair
      }
      #declare iStair = iStair + 1;
    #end
    translate startPos
  }
#end
