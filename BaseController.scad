difference() {
    import("BaseController.stl", convexity=6);
    translate([0, 0, -3]) {
        cylinder(h=5, r=0.4, $fn=20);
    }
}