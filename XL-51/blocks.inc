// Seed for the randomization of blocks' texture and size

#declare seedBlock = seed(0);

// Roundness coefficient of the blocks

#declare blockRoundness = 0.075;

// Randomness coefficient for the block dimension

#declare blockRandomness = 0.025;

// Thickness coefficient of the stairs

#declare stairThickness = 1.0 / 2.0;

// Return a random value in range [1.0 - r / 2, 1.0 + r / 2]

#macro RandAroungOne(r)
  (1.0 + (0.5 - rand(seedBlock)) * r)
#end

// Return the texture of the blocks

#macro BlockTex()
  texture {
    pigment {
      color rgb (1.0 - blockRandomness) * RandAroungOne(0.25)
    }
    normal { 
      bumps 0.25 scale .02
    }
    finish { 
      ambient 0.0 diffuse 1.0 
    }
  }
#end

// Return the scaling for the randomization of the size of the blocks

#macro BlockRandScale()
  0.5 * RandAroungOne(blockRandomness)
#end

// Return one block 

#macro Block()
  superellipsoid {
    <blockRoundness, blockRoundness>
    BlockTex()
    scale BlockRandScale()
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
      -0.5 * widthStair * rightVec;
    #local oneStairTop = 
      0.5 * widthStair * rightVec + upVec + frontVec;
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
    BlockTex()
  }
#end

#macro MakeStairsNew(
    widthStair, 
    nbStair, 
    startPos, 
    upVec, 
    rightVec, 
    frontVec) 
  union {
    #local oneStairBottom = 
      -0.5 * widthStair * rightVec + (1.0 - stairThickness) * vnormalize(upVec);
    #local oneStairTop = 
      0.5 * widthStair * rightVec + vnormalize(upVec) + frontVec;
    #local iStair = 0;
    #while (iStair < nbStair)
      #local jStair = 0;
      #while (jStair < widthStair)
        superellipsoid {
          <blockRoundness, blockRoundness>
          scale 0.5
          translate 0.5
          scale vnormalize(rightVec) + upVec * stairThickness + frontVec * (1.0 + blockRoundness)
          translate upVec * (1.0 - stairThickness)
          translate rightVec * (jStair - 0.5 * widthStair)
          translate (frontVec + upVec) * iStair
        }
        #if (iStair > 0)
          superellipsoid {
            <blockRoundness, blockRoundness>
            scale 0.5
            translate 0.5
            scale vnormalize(rightVec) + upVec * (1.0 + stairThickness) + frontVec * stairThickness
            translate -1.0 * upVec * stairThickness
            translate rightVec * (jStair - 0.5 * widthStair)
            translate (frontVec + upVec) * iStair
          }
        #end
        #declare jStair = jStair + 1;
      #end
      //box {
      //  oneStairBottom
      //  oneStairTop
      //  translate (frontVec + upVec) * iStair
      //}
      #declare iStair = iStair + 1;
    #end
    translate startPos
    BlockTex()
  }
#end

