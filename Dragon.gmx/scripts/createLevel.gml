/// createLevel(levelmap);

var data = argument0[0];
var objects = argument0[1];

var w = ds_grid_width(data[0]);
var h = ds_grid_height(data[0]);

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
        bg = ds_grid_get(data[0],i,j);
        water = ds_grid_get(data[1],i,j);
        fg = ds_grid_get(data[2],i,j);
        
        if (bg > 0) //bg tiles
            addTile(bg, i*T, j*T, LAYER_BG);

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
            instance_create(obj_x + 8, obj_y + 8, objPlayer);
        break;
        /*case "enemy":
            var e = instance_create(obj_x + 8, obj_y + 8, objEnemy);
            e.type = real(ds_map_find_value(obj, "type"));
        break;*/
    }
}

