#include "colors.inc"
#include "textures.inc"

#declare mirrorball = sphere {
    <0,0,0> 0.5
    texture { Polished_Chrome }
}

camera {
    location <0,3,-9>
    look_at <0,0,0>
}

/*
light_source {
    <5,3,-5>
    color Red
    spotlight radius 6 point_at <0,0,0>
}

light_source {
    <-5,3,-5>
    color Blue
    spotlight radius 6 point_at <0,0,0>
}
*/

plane { y 0 pigment { checker Black White } }

#macro place_mirrorballs(xAmt,zAmt,ballSize,delta)
    #local step = ballSize + delta;
    union {
        #for (xVal, 0, step * xAmt - delta, step)
            #for (zVal, 0, step * zAmt - delta, step)
                object { mirrorball scale ballSize translate <xVal,1,zVal> }
            #end
        #end
    }
#end

union {
    object { place_mirrorballs(3, 1, 2, 0.5) } translate <-2.5,0,0>
    // object { place_mirrorballs(2, 2, 2, 0.5) translate <1,2.5,1> }
}

#include "sky.pov"
