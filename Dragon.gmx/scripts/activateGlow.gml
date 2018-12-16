if (global.weather == w.DARKNESS) {
    //instance_activate_object(glow);
    if (!instance_exists(glow)) {
        glow = instance_create(x, y, objGlow);
        glow.parent = id;
    }
}
