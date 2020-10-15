include <../SCAD/constant.scad>
height = 10;

$fn=150;

difference() {
    union() {
        translate([0,ZAxis_rod_distance,0])
        cylinder(h=height+5, d=12);
        
        translate([-channelDepth/2,0,0])
        cube([channelDepth,ZAxis_rod_distance,height]);
    }
    translate([0,ZAxis_rod_distance,0])
    cylinder(h=height+5, d=4.9);    
}

