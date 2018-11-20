ini_open("save.dat");
global.spawn_x = ini_read_real("save", "spawn_x", -1);
global.spawn_y = ini_read_real("save", "spawn_y", -1);
global.spawn_dir = ini_read_real("save", "spawn_dir", d.RIGHT);
global.bg = ini_read_real("save", "bg", -1);
global.weather = ini_read_real("save", "weather", w.NONE);

var arr = string_split(ini_read_string("save", "bubbles", ""), "|");
ds_list_clear(global.ds_bubbles);
if (is_array(arr)) {
    for(var i = 0; i < array_length_1d(arr); i++) {
        ds_list_add(global.ds_bubbles, real(arr[i]));
    }
}

var arr = string_split(ini_read_string("save", "scales", ""), "|");
ds_list_clear(global.ds_scales);
if (is_array(arr)) {
    for(var i = 0; i < array_length_1d(arr); i++) {
        ds_list_add(global.ds_scales, real(arr[i]));
    }
}

var arr = string_split(ini_read_string("save", "keys", ""), "|");
ds_list_clear(global.ds_keys);
if (is_array(arr)) {
    for(var i = 0; i < array_length_1d(arr); i++) {
        ds_list_add(global.ds_keys, real(arr[i]));
    }
}

var arr = string_split(ini_read_string("save", "keyblocks", ""), "|");
ds_list_clear(global.ds_keyblocks);
if (is_array(arr)) {
    for(var i = 0; i < array_length_1d(arr); i++) {
        ds_list_add(global.ds_keyblocks, real(arr[i]));
    }
}
global.hasKey = ini_read_real("save", "hasKey", 0);

global.ability = ini_read_real("save", "ability", a.NONE);

ini_close();


