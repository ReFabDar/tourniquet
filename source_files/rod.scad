/**
 * Create the rod
 * This section should consist of a rod with a slot to create torque and tighten a tourniquet
 * connected to the base plate
**/
include <variables.scad>;

module rod(){
    difference(){
        hull(){ //the body of the rod
            translate([0,rod_r,rod_r])
            sphere(r=rod_r,$fn=rod_res);
            translate([0,rod_l-rod_r,rod_r])
            sphere(r=rod_r,$fn=rod_res);
        }

    //
        hull(){//cutting the strap entrance slot
            translate([0,(-strap_w+rod_l)/2,0])
            cylinder(r=strap_t/2,h=rod_r*2);
            translate([0,(strap_w+rod_l)/2,0])
            cylinder(r=strap_t/2,h=rod_r*2);
        }
        for(i=[0:1:rod_groove_array-1]){//cutting grooves along the rod,,gets the position of the the groove and the thickness of it and the diameter then cut it as given
            translate([0,rod_groove_p[i],rod_r])
            rotate([-90,0,0])
            rotate([0,0,0])
            difference() {
                cylinder(r=rod_r*2,h=rod_groove_l[i],$fn=rod_res+1);
                cylinder(r=rod_g,h=rod_groove_l[i],$fn=rod_res+1);
            }
            translate([0,rod_l-rod_groove_p[i],rod_r])
            rotate([90,0,0])rotate([0,0,22.5])
            difference() {
                cylinder(r=rod_r+1,h=rod_groove_l[i],$fn=rod_res);
                cylinder(r=rod_g,h=rod_groove_l[i],$fn=rod_res);
            }
        }
    }
}

rod();
