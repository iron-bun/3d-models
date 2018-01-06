module edge(l) {
    hull() {
        cylinder(r=5,h=10);
        translate([l,0,0])
        cylinder(r=5,h=10);
    }
}

module side(l) {
    union() {
        edge(l);
        rotate(240)
        mirror()
        edge(l);
    }
}

module base(r, d){
    difference(){
        cylinder(r=r, h=d);
        translate([0,0,-1])
        cylinder(r=r-20, h=d+2);
    }
}

side_length = 42;
pin_length = 34;

module pin(r, h) {
    intersection(){
        union(){
            cylinder(r=r, h=h);
            translate([-5,-10,-15])
            cube([10,20,h+30]);
        }
        translate([0,0,-20])
        cylinder(r=r, h=h+40);
    }
}

union(){
    base(41, 5);
    lift = 42;
    difference(){
        union(){
            translate([0, -pin_length/2, lift])
            rotate([90,120,0])
            side(side_length);
            translate([0, pin_length/2+10, lift])
            rotate([90,120,0])
            side(side_length);
        }
        translate([0,pin_length/2,41])
        rotate([90,0,0])
        pin(r=8, h=pin_length);
    }
}

translate([50,pin_length/2,8])
rotate([90,0,0])
pin(r=8, h=pin_length);