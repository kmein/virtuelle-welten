#include "colors.inc"
#include "textures.inc"

camera { location <0,7,150*clock-400/60> }

light_source {
    <-9,10,-9>
    rgb <253/256,246/256,227/256>
    spotlight radius 3
    point_at <3,1,3>
}

plane { y 0 pigment { White } }
// White_Marble
// Clouds
// Apocalypse
// Glass
// Glass2
// Chrome_Metal
// Water
// Starfield
#declare R = seed(317);
#macro tube()
    difference {
        object {
            cylinder { <0,5,0> <0,5,2> 5 }
        }
        object {
            cylinder { <0,5,-1> <0,5,3> 4.5 }
        }
        pigment { rgbt <rand(R),rand(R),rand(R),rand(R)> }
    }
#end

union {
    #for (i,0,200)
        object { tube() translate <0,0,i> }
    #end
}

#include "sky.pov"
