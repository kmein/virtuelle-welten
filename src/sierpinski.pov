#include "colors.inc"
#include "textures.inc"

background { color Gray }

light_source { <0,0,-2> color White }
light_source { <0,2,-2> color White }

camera {
    location <0.5,sqrt(3)/4,-1>
    look_at <0.5,sqrt(3)/4,0>
}

#declare simple_triangle = prism {
    -1 0 3
    <0,0> <1,0> <0.5,sqrt(3)/2>
    rotate <270,0,0>
    texture { Gold_Nugget }
}

#macro sierpinski(level)
    #if (level = 0)
        simple_triangle
    #else
        union {
            object {
                sierpinski(level - 1)
                scale 0.5
            }
            object {
                sierpinski(level - 1)
                scale 0.5
                translate <0.5,0,0>
            }
            object {
                sierpinski(level - 1)
                scale 0.5
                translate <0.25,sqrt(3)/4,0>
            }
        }
    #end
#end

object { sierpinski(5) }
