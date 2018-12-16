if (global.weather == w.DARKNESS) {
    if (!instance_exists(glow)) {
        glow = instance_create(x, y, objGlow);
        glow.parent = id;
    }
}
