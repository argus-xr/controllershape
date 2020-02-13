use <InputLibrary.scad>;

buttonCount = 3;
buttonLocation = [
[-10, 30, 0],
[10, 30, 0],
[0, 50, 0]
];

difference() {
        import("BaseController.stl", convexity=6);
    for(i = [0:buttonCount - 1]) {
        translate(buttonLocation[i]) {
            Button(hole=true);
        }
    }
}

for(i = [0:buttonCount - 1]) {
    translate(buttonLocation[i]) {
        Button();
    }
}