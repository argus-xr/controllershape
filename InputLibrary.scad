module Button(radius=4, height=4, key=[2, 2], keylength=1, keyheight=1, clearance=0.5, hole=false, offsetForPrint=false) {
    _keyheight = hole? keyheight + height : keyheight;
    _clearance = hole? clearance : 0;
    union() {
        translate([0, 0, -keyheight]) {
            cylinder(r=radius + _clearance, h=height + keyheight, $fa=1, $fs=1);
        }
        for(i=[0:len(key) - 1]) {
            rotate([0, 0, 360 * i/len(key)]) {
                translate([radius-keylength, 0 - key[i] * 0.5 - _clearance, keyheight * -1]) {
                    if(key[i] > 0.05) {
                        cube(size=[keylength*2 + _clearance, key[i] + _clearance*2, _keyheight]);
                    }
                }
            }
        }
    }
}

module ButtonTest() {
    Button();
    difference() {
        translate([0, 0, -4]) {
            cube(size=[20, 20, 10], center=true);
        }
        Button(hole=true);
    }
}