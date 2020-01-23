//!OpenSCAD
include <nutsnbolts/cyl_head_bolt.scad>;

type = "M12";

	df = _get_fam(type);
	nutkey = df[_NB_F_NUT_KEY];
	nutheight = df[_NB_F_NUT_HEIGHT];
	orad = df[_NB_F_OUTER_DIA]/2;
	lead = df[_NB_F_LEAD];
	irad = orad-lead;
    

union(){
    //Round body pressing pick holder
    translate([0,0,nutheight/2]){
    difference(){
        cylinder(r1=(nutkey/2)+1.5, r2=(nutkey/2)+1.5, h=nutheight/3,$fn=360, center=false);
        translate([0,0,-1]){
            cylinder(r1=orad+0.2, r2=orad+0.2, h=nutheight+2,$fn=360, center=false);
        }
    }
}
    //End of body pressing pixk holder


difference(){

union(){
    translate([0,0,nutheight]){
        nut(type, thread="modeled");
    }
    //Round body around nut
    difference(){
        cylinder(r1=(nutkey/2)+1.5, r2=(nutkey/2)+1.5, h=nutheight,$fn=360, center=false);
        translate([0,0,-1]){
            cylinder(r1=orad, r2=orad, h=nutheight+2,$fn=360, center=false);
        }
    }
    //End of round body

    //Knob
    translate([0,5,0]){
    difference() {
      cylinder(r1=(nutkey/2)+1.5, r2=(nutkey/2)+1.5, h=nutheight,$fn=360, center=false);
    
      union(){
        translate([1.25*nutheight, nutheight/2, 0]){
          cylinder(r1=nutheight, r2=nutheight, h=nutheight,$fn=360, center=false);
        }
        translate([-(1.25 * nutheight), nutheight/2, 0]){
          cylinder(r1=nutheight, r2=nutheight, h=nutheight,$fn=360, center=false);
        }
        translate([-nutheight/2, -0.75*nutkey, 0]){
          cube([nutkey, nutkey, nutheight], center=false);
        }
      }
    }    
    }
    //End of knob
}
//Slices the nut in two
translate([-nutkey,-nutkey,nutheight/2]){
          cube([nutkey*2, nutkey*2, nutheight], center=false);    
}
//End of slicing the nut in two
}
}


