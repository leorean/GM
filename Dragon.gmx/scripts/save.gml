global.spawn_x = argument0;
global.spawn_y = argument1;
global.spawn_dir = objPlayer.dir;
global.coinsCollected = 0;

ini_open("save.dat");

ini_write_real("save", "spawn_x", global.spawn_x);
ini_write_real("save", "spawn_y", global.spawn_y);
ini_write_real("save", "spawn_dir", global.spawn_dir);
ini_write_real("save", "bg", global.bg);
ini_write_real("save", "weather", global.weather);
ini_write_real("save", "coins", global.coins);
saveFromList(global.ds_chests, "chests");
saveFromList(global.ds_hps, "hps");
saveFromList(global.ds_bubbles, "bubbles");
saveFromList(global.ds_scales, "scales");
saveFromList(global.ds_keys, "keys");
saveFromList(global.ds_keyblocks, "keyblocks");
saveFromList(global.ds_gates, "gates");
saveFromList(global.ds_bosses, "bosses");
saveFromList(global.ds_teleporters, "teleporters");

ini_write_real("save", "hasKey", global.hasKey);
ini_write_real("save", "ability", global.ability);

ini_close();
