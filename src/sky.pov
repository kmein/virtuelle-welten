// sky -----------------------------------
sky_sphere {
   pigment {
       gradient y
       color_map {
           [0.0 color rgb <1,1,1>]
           [0.3 color rgb <0.18,0.28,0.75>*0.8]
           [1.0 color rgb <0.15,0.28,0.75>*0.5]
       }
       scale 1.05
       translate <0,-0.05,0>
   }
}

// spherical cloud layer ----------------
#declare R_planet = 6000000;
#declare R_sky    = R_planet + 2000;
sphere {
    <0,-R_planet,0>, R_sky hollow
    texture {
        pigment {
            bozo turbulence 0.75
            octaves 6 omega 0.7
            lambda 2  phase 0.15
            color_map {
                [0.00 color rgb <1,1,1>*0.95]
                [0.05 color rgb <1,1,1>*1.25]
                [0.15 color rgb <1,1,1>*0.85]
                [0.55 color rgbt <1,1,1,1>]
                [1.00 color rgbt <1,1,1,1>]
            }
            translate <clock*3,0,clock*-1>
            scale <0.3,0.4,0.2>*3
        }
        finish { emission 1 diffuse 0 }
        finish { ambient 1 diffuse 0 }
        scale 3000
    }
   // no_shadow  // optional
}
