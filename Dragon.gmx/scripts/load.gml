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
global.ability = ini_read_real("save", "ability", a.NONE);

ini_close();


