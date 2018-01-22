// Utilitech MPL1004-LED10K840 Leg Mount
// Chris Nowicki 
// 2018

//screw holes 16mm apart
screw_dist_from_center=8;
// overall 24mm

//mount
mount_radius=12;
mount_height=6;

//post
post_height = mount_height + 2.5;
post_radius = 4.25;
post_hole_dia = 6.5;

// nut dimensions, pretending it's a circle
// The original part is threaded with an M6
nut_radius = 12/2;
nut_height = 5;
nut_res=6;


//screw_hole
bevel_top_dia=3;
bevel_depth=1.45;
screw_radius = 3.14/2;
screw_height_minus_bevel = mount_height - bevel_depth;

difference(){
    // create the solid object
    union() {
        cylinder(r=mount_radius, h=mount_height, $fn=100);
        cylinder(r=post_radius, h=post_height, $fn=100);
    }
    

    // post nut
    rotate([0, 0, 90]) {
        cylinder(r=nut_radius, h=nut_height, $fn=nut_res);        
    }  
    
    // post hole
    translate([0, 0, 0]) {
        cylinder(d=post_hole_dia, h=post_height,$fn=100);
    }

    //  right screw hole
    translate([screw_dist_from_center, 0, mount_height-bevel_depth]) {                                                   
        cylinder(r1=screw_radius,r2=bevel_top_dia, h=bevel_depth, $fn=100 );                     
    }
    translate([screw_dist_from_center, 0, 0]) {
        cylinder(r=screw_radius, h=mount_height-bevel_depth, $fn=100);         
    }   

    // left screw hole
    translate([-screw_dist_from_center, 0, mount_height-bevel_depth]) {                                                   
        cylinder(r1=screw_radius,r2=bevel_top_dia, h=bevel_depth, $fn=100 );                     
    }
    translate([-screw_dist_from_center, 0, 0]) {
        cylinder(r=screw_radius, h=mount_height-bevel_depth, $fn=100);         
    }

}

       
        
    

echo(str("mount_height = ", mount_height));
    


