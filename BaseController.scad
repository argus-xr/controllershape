use <InputLibrary.scad>;
use <PartsLibrary.scad>;

buttonGroupLocation = [5, -30, 0];
buttonGroupRotation = [0, 0, 0];
buttonCount = 4;
buttonLocation = [
[-10, 0, 0],
[0, 10, 0],
[10, 0, 0],
[0, -10, 0]
];
buttonKey = [
[1,2,2,2],
[1,2,1,2],
[1,1,2,2],
[1,1,1,2]
];
buttonRadius = [
6, 6, 6, 6
];
buttonDepth = 1;

controller();

module controller(includeParts = true) {
    difference() {
        rotate([0, 0, 180]) {
                import("BaseController.stl", convexity=6);
            }
        translate(buttonGroupLocation) {
            for(i = [0:buttonCount - 1]) {
                translate(buttonLocation[i]) {
                    ButtonInternal(num=i, hole=true);
                    translate([0, 0, -buttonDepth]) {
                        PushButton2Pin(hole=true);
                    }
                }
            }
        }
    }
    
    if(includeParts) {
        color("Red") {
            translate(buttonGroupLocation) {
                for(i = [0:buttonCount - 1]) {
                    translate(buttonLocation[i]) {
                        ButtonInternal(num=i);
                        translate([0, 0, -buttonDepth]) {
                            PushButton2Pin();
                        }
                    }
                }
            }
        }
    }
}

module controllerTopCutout() {
    translate(buttonGroupLocation + [0, 0, -22]) {
        rotate([0, 0, 45]) {
            cube(size=[25, 25, 30], center=true);
        }
    }
}

module ButtonInternal(num, hole) {
    Button(radius = buttonRadius[num], key=buttonKey[num], keyheight=buttonDepth, travel=PushButton2PinTravel() + 0.5, hole=hole);
}