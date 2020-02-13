module Button(radius=4, height=4, key=[2, 2], keylength=1, keyheight=1, clearance=0.25, hole=false, offsetForPrint=false, travel=0.5) {
    _keyheight = hole? keyheight + height : keyheight;
    _clearance = hole? clearance : 0;
    _cylinderBottom = hole? -(keyheight + travel) : -keyheight;
    union() {
        if(hole) {
            translate([0, 0, _cylinderBottom]) {
            cylinder(r=radius + _clearance, h=height + clearance - _cylinderBottom, $fa=1, $fs=1);
            }
        } else {
            rotate_extrude($fa=1, $fs=1) {
                edgeRadius = min(radius, height)*0.25;
                polygon(points=[[0, height], [radius - edgeRadius, height], [radius - edgeRadius * 0.293, height - edgeRadius * 0.293], [radius, height - edgeRadius], [radius, _cylinderBottom], [0, _cylinderBottom]]);
            }
        }
        for(i=[0:len(key) - 1]) {
            rotate([0, 0, 360 * i/len(key)]) {
                translate([radius-keylength, 0 - key[i] * 0.5 - _clearance, _cylinderBottom]) {
                    if(key[i] > 0.05) {
                        cube(size=[keylength*2 + _clearance, key[i] + _clearance*2, _keyheight - (hole? travel : 0)]);
                    }
                }
            }
        }
    }
}

module ButtonTest() {
    Button();
    difference() {
        translate([0, 0, -5]) {
            cube(size=[20, 20, 10], center=true);
        }
        Button(hole=true);
    }
}

ButtonTest();