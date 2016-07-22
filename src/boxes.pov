#include "colors.inc"
#include "textures.inc"
#declare R = seed(1);

/**
This function places a randomly colored box at some coordinates
posX, posY, posZ are the coordinates
boxSize is the length of the box
*/
#macro random_box(posX,posY,posZ,boxSize)
    box {
        <posX,posY,posZ> <posX+boxSize,posY+boxSize,posZ+boxSize>
        pigment {
            color rgbf <rand(R),rand(R),rand(R),rand(R)>
        }
    }
#end

/**
This function places an m*n*o cuboid made from randomly colored subcubes
posX, posY, posZ are the initial coordinates
amtX, amtY, amtZ are the lengths of the cuboid vertices
boxSize is the length of one subcube
delta is the distance between two cubes
*/
#macro place_boxes3d(posX,posY,posZ,amtX,amtY,amtZ,boxSize,delta)
    #local maxX = amtX * boxSize + (amtX - 1) * delta;
    #local maxY = amtY * boxSize + (amtY - 1) * delta;
    #local maxZ = amtZ * boxSize + (amtZ - 1) * delta;
    #local skip = boxSize + delta;
    union {
        #for (cX, posX, maxX, skip)
            #for (cY, posY, maxY, skip)
                #for (cZ, posZ, maxZ, skip)
                    object { random_box(cX,cY,cZ,boxSize) }
                #end
            #end
        #end
    }
#end

camera { location <-11,17,-13> look_at <20,0,20> }

light_source {
    <-9,50,-9>
    color White
    spotlight radius 9
    point_at <3,0,3>
}
plane { <0,-1,0> 0 texture { Polished_Chrome } }

union {
    object {
        place_boxes3d(
            0,0,0,
            20,10,20,
            1,0.25
        )
    }
}

