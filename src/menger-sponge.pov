#include "colors.inc"
#include "transforms.inc"

camera { location <6,3,-6> look_at 0 }
light_source {
    <40.5,40.5,-10>
    color White
    spotlight radius 3*3*3
    point_at 0
}
light_source {
    <-10,40.5,40.5>
    color White
    spotlight radius 3*3*3
    point_at 0
}
background{White}
// plane { y (-1) pigment { White } }

#macro sponge_fragment(Size)
    union {
        #for (xPos, 0, 2)
            #for (yPos, 0, 2)
                #for (zPos, 0, 2)
                    #if (!((xPos = 1 & yPos = 1) | (yPos = 1 & zPos = 1) | (zPos = 1 & xPos = 1)))
                        #local vect = <xPos,yPos,zPos>*Size;
                        object {
                            box { vect (vect+Size) }
                            pigment { Red }
                        }
                    #end
                #end
            #end
        #end
    }
#end

#macro menger_sponge(Depth, Size)
    union {
        #if (Depth = 0)
            sponge_fragment(Size)
        #else
            #for (xPos, 0, 2)
                #for (yPos, 0, 2)
                    #for (zPos, 0, 2)
                        #if (!((xPos = 1 & yPos = 1) | (yPos = 1 & zPos = 1) | (zPos = 1 & xPos = 1)))
                            object {
                                menger_sponge(Depth-1,Size/3)
                                translate <xPos,yPos,zPos>*Size
                            }
                        #end
                    #end
                #end
            #end
        #end
    }
#end

union {
    object { menger_sponge(4,1) }
    /* object {
        box { 0 sqrt(3)*3 }
        rotate <0,0,-45>
        translate <0,-1,0>
        pigment { Green }
        // Rotate_Around_Trans(<0,-45,0>,<0,-1,0>)
        // rotate <45,0,45>
    }
    */
}
