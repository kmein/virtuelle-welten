#include "colors.inc"

camera {
    location <-0.2*clock,0,2*clock>
}

background { White }

light_source { <10,10,-10> color White}
light_source { <0,20,-10> color White }

object {
    box {
        <-2,-2,-2>, <2,2,10>
        pigment {
            mandel 10000
            exponent 2
            interior 1, 1
            color_map {
                [0 rgb 0]
                [0.2 rgb 1-x]
                [0.4 rgb (1-x)+(1-y)]
                [1 rgb 1]
                [1 rgb 0]
            }
        }
    } translate <0,1,0>
}
