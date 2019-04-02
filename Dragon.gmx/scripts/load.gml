ini_open("save.dat");

global.spawn_x = ini_read_real("save", "spawn_x", -1);
global.spawn_y = ini_read_real("save", "spawn_y", -1);
global.spawn_dir = ini_read_real("save", "spawn_dir", d.RIGHT);
global.bg = ini_read_real("save", "bg", -1);
global.weather = ini_read_real("save", "weather", w.NONE);
global.coins = ini_read_real("save", "coin", 0);

loadFromList(global.ds_coins, "coins");
loadFromList(global.ds_chests, "chests");
loadFromList(global.ds_hps, "hps");
loadFromList(global.ds_bubbles, "bubbles");
loadFromList(global.ds_scales, "scales");
loadFromList(global.ds_keys, "keys");
loadFromList(global.ds_keyblocks, "keyblocks");
loadFromList(global.ds_gates, "gates");
loadFromList(global.ds_bosses, "bosses");
loadFromList(global.ds_teleporters, "teleporters");

loadFromMap(global.ds_openchests, "openchests");

global.hasKey = ini_read_real("save", "hasKey", 0);
global.ability = ini_read_real("save", "ability", a.NONE);

ini_close();


