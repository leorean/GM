global.spawn_x = x;
global.spawn_y = y;
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

ini_close();

/*
global.ds_bubbles = ds_list_create();
global.spawn_x = -1;
global.spawn_y = -1;
global.bg = -1;
global.weather = w.NONE;
*/
