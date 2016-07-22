#include "colors.inc"
#include "textures.inc"

camera {
    location <0,7,-8>
    look_at 1
    rotate <0,clock*360,0>
}

light_source {
    <0,7,-9>
    color LimeGreen
    spotlight radius 0.5 point_at <0,1,1>
}

plane { y 0 pigment { White } }

#macro tree_fragment(C, Alpha, ScaleY)
    #local Alpha_rad = radians(Alpha);
    #local A = C * sin(Alpha_rad);
    #local B = sqrt(C*C - A*A);
    #local H = B * sin(Alpha_rad);
    #local C_ = B * cos(Alpha_rad);
    union {
        object {
            box { 0 <C,C*ScaleY,C> }
            texture { DMFWood5 }
        }
        object {
            prism { 0 C 4
                <0,0>
                <C_,H>
                <C,0>
                <0,0>
            }
            rotate <-90,0,0>
            translate <0,C*ScaleY,0>
            translate <0,0,C>
            texture { Jade scale 0.2 }
        }
    }
#end

#macro pythagoras_tree(C, Alpha, Depth, ScaleY, Rotate)
    #local Sapling = seed(123456789);
    #local Rotation = rand(Sapling)*90*Rotate;
    #local Alpha_rad = radians(Alpha);
    #local A = C * sin(Alpha_rad);
    #local B = sqrt(C*C - A*A);
    #local C_ = B * cos(Alpha_rad);
    #local H = B * sin(Alpha_rad);
    #if (Depth = 0)
        object {
            tree_fragment(C, Alpha, ScaleY)
            rotate <0,Rotation,0>
        }
    #else
        union {
            object {
                tree_fragment(C, Alpha, ScaleY) rotate <0,Rotation,0>
            }
            object {
                pythagoras_tree(sqrt(C*C - A*A), Alpha, Depth-1, ScaleY, Rotate)
                rotate <0,0,Alpha>
                translate <0,C*ScaleY,0>
            }
            object {
                pythagoras_tree(A, Alpha, Depth-1, ScaleY, Rotate)
                rotate <0,0,360-degrees(asin(B/C))>
                translate <C_,0,0>
                translate <0,C*ScaleY+H,0>
            }
            rotate <0,Rotation,0>
        }
    #end
#end

union {
    object { pythagoras_tree(1, 45, 14, 1.7, 1) }
    object { pythagoras_tree(1, 45, 14, 1.7, 1) rotate <0,90,0> translate x }
    //object {
    //    text {
    //        ttf "crystal.ttf" str(clock, 2, 0) 0.1, 0
    //    }
    //    translate <0,0,-3>
    //}
}

