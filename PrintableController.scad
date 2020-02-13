use <BaseController.scad>

splitCubeZOffset = -15;
splitCubeTranslation = [0, 100, -50 + splitCubeZOffset];
splitCubeSize = [200, 300, 100];
splitCubeRotation = [-15, 0, 0];

controllerBottom(layFlat=true);
controllerTop(layFlat=true);

module controllerTop(layFlat = false) {
    translate(layFlat? [0, 0, -splitCubeZOffset] : [0, 0, 0]) {
        rotate(layFlat? -splitCubeRotation : [0, 0, 0]) {
            difference() {
                controller(includeParts = false);
                splitCube();
            }
        }
    }
}

module controllerBottom(layFlat = false) {
    translate(layFlat? [0, 0, splitCubeZOffset] : [0, 0, 0]) {
        rotate(layFlat? -splitCubeRotation + [180, 0, 0] : [0, 0, 0]) {
            intersection() {
                controller(includeParts = false);
                splitCube();
            }
        }
    }
}

module splitCube() {
    rotate(splitCubeRotation) {
        translate(splitCubeTranslation) {
            cube(size=splitCubeSize, center=true);
        }
    }
}