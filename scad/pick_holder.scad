//!OpenSCAD
include <nutsnbolts/cyl_head_bolt.scad>;

flat_angle = 15;

difference() {
  //Begining of main structure  
  difference() {
    union(){
        difference(){
          //main shaft
          cylinder(r1=3, r2=3, h=50, $fn=360,center=false);
          //flat spot
          rotate([0,0,flat_angle]){
          translate([5,0,50]){
            cube([6,6,75],center=true);
          }
        }
      }         

      cylinder(r1=5.5, r2=3, h=15, $fn=360,center=false);
      translate([0, 0, 5]){
        cube([20, 7.5, 10], center=true);
      }
    }
    

    //Slit for pick
    translate([0, 0, 4]){
      cube([20, 2.6, 8], center=true);
    }
    //End of slit
  }
  //End of main structure

  //Begining of drill holes
  union(){
     translate([-4, 3, 4]){
      rotate([90, 0, 0]){
          cylinder(r1=1.5, r2=1.5, h=8, $fn=360,center=false);
      }
    }
     translate([4, 3, 4]){
      rotate([90, 0, 0]){
          cylinder(r1=1.5, r2=1.5, h=8, $fn=360,center=false);
      }
    }
  }
  //End of drill holes
}

