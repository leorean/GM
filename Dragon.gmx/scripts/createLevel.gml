/// createLevel(levelmap);

var data = argument0[0];
var objects = argument0[1];

var w = ds_grid_width(data[0]);
var h = ds_grid_height(data[0]);

var bg2 = 0;
var bg = 0;
var fg = 0;
var water = 0;
var obj = 0;

if (room_width!=w*T || room_height!=h*T)
{
    room_set_width(room,w*T);
    room_set_height(room,h*T);
    room_restart();
    exit;
}

// tiles
for (var i = 0; i<w; i ++)
{
    for (var j = 0; j<h; j++)
    {
        bg2 = ds_grid_get(data[0],i,j);
        bg = ds_grid_get(data[1],i,j);
        water = ds_grid_get(data[2],i,j);
        fg = ds_grid_get(data[3],i,j);
        
        if (bg > 0) //bg tiles
            addTile(bg, i*T, j*T, LAYER_BG);

        if (bg2 > 0) //bg tiles
            addTile(bg2, i*T, j*T, LAYER_BG2);

        switch (water) {//water tiles
            case -1: // nothing
            break;
            default:
                var t = addTile(water, i*T, j*T, LAYER_WATER);
            break;
        }
        
        switch(fg) {
            case -1: // nothing
            break;
            case 0: // platforms
                addTile(fg, i*T, j*T, LAYER_FG);
                instance_create(i*T, j*T, objPlatform);
            break;
            case 4: // spikes
                addTile(fg, i*T, j*T, LAYER_FG);
                instance_create(i*T, j*T, objEnemySpike);
            break;
            default:
                addTile(fg, i*T, j*T, LAYER_FG);
                instance_create(i*T, j*T, objSolid);
            break;
        }
    }
}

// objects
for (var i = 0; i < ds_list_size(objects); i++) {
    var obj = ds_list_find_value(objects, i);
    
    var obj_type = ds_map_find_value(obj, "type");
    var obj_x = real(ds_map_find_value(obj, "x"));
    var obj_y = real(ds_map_find_value(obj, "y"));
    
    switch(obj_type) {
        case "player":
            instance_create(obj_x + 8, obj_y + 8, objCamera);
            if (global.spawn_x == -1 || global.spawn_y == -1) {
                instance_create(obj_x + 8, obj_y + 8, objPlayerEgg);
            }
            else {
                var o_player = instance_create(global.spawn_x, global.spawn_y, objPlayer);
                o_player.dir = global.spawn_dir;
            }
        break;
        case "ambience":
            var amb = instance_create(obj_x, obj_y, objAmbience);
            amb.bg = real(ds_map_find_value(obj, "bg"));
            amb.weather = real(ds_map_find_value(obj, "weather"));
        break;
        case "bubble":
            var bubble = instance_create(obj_x + 8, obj_y + 8, objPickupBubble);
            bubble.b_id = real(ds_map_find_value(obj, "b_id"));
        break;
        case "save":
            instance_create(obj_x + 8, obj_y + 8, objSave);
        break;
        case "enemy":
            var e = instance_create(obj_x + 8, obj_y + 8, objEnemy);
            e.type = real(ds_map_find_value(obj, "enemyType"));
            
            e.path_spd = real(ds_map_find_value(obj, "path_speed"));
            // offset
            e.x += real(ds_map_find_value(obj, "path_x"));
            e.y += real(ds_map_find_value(obj, "path_y"));
            
            e.onGround = real(ds_map_find_value(obj, "onGround"));
            
            var path_str = string(ds_map_find_value(obj, "path"));
            var path_parts = string_split(path_str, "|");
            var path_precision = real(ds_map_find_value(obj, "path_precision"));
            var path_smooth = real(ds_map_find_value(obj, "path_smooth"));
            for(var path_i = 0; path_i < array_length_1d(path_parts); path_i++) {
                var path_p = string_split(path_parts[path_i], ",");
                var px = real(path_p[0]);
                var py = real(path_p[1]);
                path_add_point(e.path, px, py, 100);
            }
            path_set_kind(e.path, path_smooth);
            path_set_precision(e.path, path_precision);
            path_set_closed(e.path, 1);
            /*for(var _pi = 0; _pi < path_get_number(e.path); _pi ++) {
                c_out(path_get_point_x(e.path, _pi), path_get_point_y(e.path, _pi));
            }*/
            
        break;
    }
}

