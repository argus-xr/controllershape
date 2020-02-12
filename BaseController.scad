difference() {
    import("BaseController.stl", convexity=6);
    translate([0, 50, -5]) {
        cylinder(h=50, r=4, $fn=20);
    }
}