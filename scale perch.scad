module edge() {
    hull() {
        cylinder(r=10,h=10);
        translate([50,0,0])
        cylinder(r=10,h=10);
    }
}

module side() {
    difference() {
        union() {
            edge();
            rotate(60) {
            edge();
            }
        }
        translate([0,0,-5])
        cylinder(r=5, h=20, $fn=5);
        translate([50,0,-5])
        cylinder(r=5, h=20, $fn=5);
        rotate(60)
        translate([50,0,-5])
        cylinder(r=5, h=20, $fn=5);
    }
}

module pin(l) {
    rotate([0,90,0]){
        cylinder(r=5, h=l+20, $fn=5);
        translate([0,0,10])
        cylinder(r=8, h=l);
    }
}

pin_length = 90;
for (i = [0:2]) {
    translate([0,i*20,8])
    pin(pin_length);
}

translate([10,-70,0])
side();

translate([110,-40,0])
rotate(180)
side();