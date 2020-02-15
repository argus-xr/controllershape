PushButton2Pin();
difference() {
    translate([0, 0, -2.1]) {
        cube([5, 10, 4], center=true);
    }
    PushButton2Pin(hole=true);
}

function PushButton2PinDepth() = 4.0;
function PushButton2PinTravel() = 0.3;

module PushButton2Pin(hole=false, tolerance=0.25, holeDepth=5) {
    _tolerance = hole? tolerance : 0;
    _holeDepth = hole? holeDepth + 0.8 : 0;
    translate([0, 0, -0.8]) {
        translate([0, 0, -3.5/2 + _holeDepth/2]) {
            color("Gray") {
                cube([3.5+_tolerance*2, 6+_tolerance*2, 3.5 + _holeDepth], center=true);
            }
        }
        if(!hole) {
            color("Black") {
                translate([0, 0, 0.4]) {
                    cube([1.5, 3, 1], center=true);
                }
                translate([0, 2.4, 0]) {
                    cube([2, 1, 1], center=true);
                }
                translate([0, -2.4, 0]) {
                    cube([2, 1, 1], center=true);
                }
            }
            color("White") {
                translate([0, 3, -4.8]) {
                    cube([0.8, 0.1, 4], center=true);
                }
                translate([0, -3, -4.8]) {
                    cube([0.8, 0.1, 4], center=true);
                }
            }
        } else {
            color("White") {
                translate([0, 3.35, (-6.8 + _holeDepth) / 2]) { // leads go down to -6.8 mm
                    cube([1 + _tolerance*2, 0.7 + _tolerance*2, 6.8 + _holeDepth], center=true);
                }
                translate([0, -3.35, (-6.8 + _holeDepth) / 2]) {
                    cube([1 + _tolerance*2, 0.7 + _tolerance*2, 6.8 + _holeDepth], center=true);
                }
            }
        }
    }
}