include <../SCAD/constant.scad>

$fn=150;

height=5;
stepMotorScrewSpacing = 31/2;
drillMarkLength = channelDepth+channelWidth*2;
ZFrameOffset = channelThickness+ZAxis_top_hole_rod_offset
+ZAxis_top_hole_rod_R2+DrillBitDameter/2;

maxHoleSize=5; 
minHoleSize=1; 
//right side
/*
CylD1=maxHoleSize;
CylD2=minHoleSize;   

*/


//Left side
CylD1=minHoleSize;
CylD2=maxHoleSize;

if(CylD1>CylD2) {
    translate([-channelWidth,channelDepth/2+height/2,0])
    difference() {
        cube([drillMarkLength, height,height*2],true);
        
        translate([-drillMarkLength/2,-height/2,0])
        rotate([0,90,0])
        cylinder(h=drillMarkLength, d=2);

    }
} else {
    translate([-channelWidth,-channelDepth/2-height/2,0])
    difference() {
        cube([drillMarkLength, height,height*2],true);
        
        translate([-drillMarkLength/2,height/2,0])
        rotate([0,90,0])
        cylinder(h=drillMarkLength, d=2);

    }
}
difference() {
    translate([-channelWidth,0,height/2])
    cube([drillMarkLength,channelDepth,height],true);

    if(CylD1>CylD2) {
        translate([-drillMarkLength,channelDepth/2,0])
        rotate([0,90,0])
        cylinder(h=drillMarkLength*2, d=2);
    } else {
        translate([-drillMarkLength,-channelDepth/2,0])
        rotate([0,90,0])
        cylinder(h=drillMarkLength*2, d=2);        
    }
    
    // motor shaft
    cylinder(h=height+0.2, d1=CylD1, d2=CylD2);

    // Z rod
    if(CylD1>CylD2) {
        translate([0,ZAxis_rod_distance,0])
        cylinder(h=height+0.2, d1=CylD1, d2=CylD2);
    } else {
        translate([0,-ZAxis_rod_distance,0])
        cylinder(h=height+0.2, d1=CylD1, d2=CylD2);
    }

    // stepper screw hole
    translate([stepMotorScrewSpacing,stepMotorScrewSpacing,-0.1])
    cylinder(h=height+0.2, d1=CylD1, d2=CylD2);

    translate([stepMotorScrewSpacing,-stepMotorScrewSpacing,-0.1])
    cylinder(h=height+0.2, d1=CylD1, d2=CylD2);

    translate([-stepMotorScrewSpacing,stepMotorScrewSpacing,-0.1])
    cylinder(h=height+0.2, d1=CylD1, d2=CylD2);

    translate([-stepMotorScrewSpacing,-stepMotorScrewSpacing,-0.1])
    cylinder(h=height+0.2, d1=CylD1, d2=CylD2);
    
    //back Z frame hole
    for(posY = [-(channelDepth/2-channelThickness)+channelThickness/2
                    :maxHoleSize
                    :channelDepth/2-channelThickness])  {
        translate([-ZFrameOffset,posY,-0.1])
        cylinder(h=height+0.2, d1=CylD1, d2=CylD2);

        translate([-ZFrameOffset-channelWidth,posY,-0.1])
        cylinder(h=height+0.2, d1=CylD1, d2=CylD2);
    }

    for(posX = [-ZFrameOffset
                    :-maxHoleSize
                    :-ZFrameOffset-channelWidth])  {

        translate([posX, -(channelDepth/2-channelThickness)+channelThickness/2, -0.1])   
        cylinder(h=height+0.2, d1=CylD1, d2=CylD2);

        translate([posX, channelDepth/2-channelThickness, -0.1])   
        cylinder(h=height+0.2, d1=CylD1, d2=CylD2);

    }    
}

