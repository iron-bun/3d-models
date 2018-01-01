module tab(x, y, z, r) {
    translate([x,y,z])
    rotate(r,0,0)
    difference() {
        cube([20,10,40]);
        translate([10,-20,30])
        rotate([0,90,90])
        cylinder(h=40,r=2);
    }
}

module stand()
    union(){
        rotate_extrude($fn=500)
        translate([100, 0, 0])
        circle(r=10, $fn=100);
        tab(10,-110,0,90);
        tab(-110,0,0,0);
    }

 module wall()
    translate([-200,-200,-100])
    cube(200);

difference() {
    stand();
    wall();
}