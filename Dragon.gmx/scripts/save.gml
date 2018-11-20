global.spawn_x = argument0;
global.spawn_y = argument1;
global.spawn_dir = objPlayer.dir;

ini_open("save.dat");
ini_write_real("save", "spawn_x", global.spawn_x);
ini_write_real("save", "spawn_y", global.spawn_y);
ini_write_real("save", "spawn_dir", global.spawn_dir);
ini_write_real("save", "bg", global.bg);
ini_write_real("save", "weather", global.weather);

var str = "";
for(var i = 0; i < ds_list_size(global.ds_bubbles); i++) {
    str += string(ds_list_find_value(global.ds_bubbles, i));
    if (i < ds_list_size(global.ds_bubbles) - 1) {
        str += "|";
    }
}
ini_write_string("save", "bubbles", str);

var str = "";
for(var i = 0; i < ds_list_size(global.ds_scales); i++) {
    str += string(ds_list_find_value(global.ds_scales, i));
    if (i < ds_list_size(global.ds_scales) - 1) {
        str += "|";
    }
}
ini_write_string("save", "scales", str);

var str = "";
for(var i = 0; i < ds_list_size(global.ds_keys); i++) {
    str += string(ds_list_find_value(global.ds_keys, i));
    if (i < ds_list_size(global.ds_keys) - 1) {
        str += "|";
    }
}
ini_write_string("save", "keys", str);

var str = "";
for(var i = 0; i < ds_list_size(global.ds_keyblocks); i++) {
    str += string(ds_list_find_value(global.ds_keyblocks, i));
    if (i < ds_list_size(global.ds_keyblocks) - 1) {
        str += "|";
    }
}
ini_write_string("save", "keyblocks", str);

ini_write_real("save", "hasKey", global.hasKey);

ini_write_real("save", "ability", global.ability);

ini_close();
