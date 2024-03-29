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
            case 480: // save
                instance_create(i*T + 8, j*T + 8, objSave);
            break;
            case 481: // dragon scales
                var scale = instance_create(i*T + 8, j*T + 8, objPickupDragonScale);
                scale.identifier = createID(scale);
                global.maxScales++;
            break;
            case 482:
                var bubble = instance_create(i*T + 8, j*T + 8, objPickupBubble);
                bubble.identifier = createID(bubble);
            break;
            case 0: // platforms
            case 103:
            case 259:
            case 260:
            case 261:
            case 148:
                addTile(fg, i*T, j*T, LAYER_FG);
                instance_create(i*T, j*T, objPlatform);
                
                // hack to see if there should be a no-bubble object
                if (ds_grid_get(data[3],i,j-1) == 421) {
                    instance_create(i*T, j*T, objNoBubble);
                }
            break;
            case 421: // NO-bubble
                instance_create(i*T, j*T, objNoBubble);
            break;
            case 422: // key
                var key = instance_create(i*T + 8, j*T + 8, objPickupKey);
                key.identifier = createID(key);
            break;
            case 423: // keyblock
                var keyBlock = instance_create(i*T, j*T, objKeyBlock);
                keyBlock.identifier = createID(keyBlock);
                keyBlock.d_x = fg % global.TW;
                keyBlock.d_y = fg div global.TW;                
            break;
            case 448: // spikes up
            case 452:
                addTile(fg, i*T, j*T, LAYER_FG);            
                instance_create(i*T, j*T, objSpikeUp);
            break;
            case 449: // spikes down
            case 453:
                addTile(fg, i*T, j*T, LAYER_FG);            
                instance_create(i*T, j*T, objSpikeDown);
            break;
            case 450: // spikes right
                addTile(fg, i*T, j*T, LAYER_FG);            
                instance_create(i*T, j*T, objSpikeRight);
            break;
            case 451: // spikes left
                addTile(fg, i*T, j*T, LAYER_FG);            
                instance_create(i*T, j*T, objSpikeLeft);
            break;
            case 290: // lava (top)
                instance_create(i*T, j*T, objLavaBubble);
            case 322: // lava (deep)
                addTile(fg, i*T, j*T, LAYER_FG);
                instance_create(i*T, j*T, objObstacle);
            break;
            case 424: // blocks
            case 425:
                var block = instance_create(i*T, j*T, objBlockSpawn);
                block.d_x = fg % global.TW;
                block.d_y = fg div global.TW;
            break;
            case 416: // switch
                var sw = instance_create(i*T + 8, j*T + 8, objSwitch);
                sw.d_x = fg % global.TW;
                sw.d_y = fg div global.TW;
            break;
            case 418: // switchblock (default: on)
                var sb = instance_create(i*T, j*T, objSwitchBlock);
                sb.d_x = fg % global.TW;
                sb.d_y = fg div global.TW;
                sb.defaultState = 0;
                addTile(420, i*T, j*T, LAYER_BG - 1);
            break;
            case 419: // switchblock (default: off)
                var sb = instance_create(i*T, j*T, objSwitchBlock);
                sb.d_x = fg % global.TW;
                sb.d_y = fg div global.TW;
                sb.defaultState = 1;
                addTile(420, i*T, j*T, LAYER_BG - 1);
            break;
            case 385: // big blocks (blocking until having >= bubbles)
            case 387:
            case 389:
            case 391:
            case 393:
            case 395:
            case 397:
                var block = instance_create(i*T-T,j*T-T, objBigBlock);
                block.d_x = fg % global.TW - 1;
                block.d_y = fg div global.TW - 1;
                block.requiredBubbles = (fg - 385) / 2;
            break;
            case 276: // ice solid (slippery)
            case 277:
            case 278:
            case 279:
            case 338:
            case 339:
            case 340:
                addTile(fg, i*T, j*T, LAYER_FG);
                instance_create(i*T, j*T, objIceBlock);
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
            if (global.spawn_x == -1 || global.spawn_y == -1) {
                instance_create(
                    ((obj_x div view_wview) * view_wview) + .5 * view_wview, 
                    ((obj_y div view_hview) * view_hview) + .5 * view_hview, objCamera);
                instance_create(obj_x + 8, obj_y + 8, objPlayerEgg);
            }
            else {
                instance_create(
                    ((global.spawn_x div view_wview) * view_wview) + .5 * view_wview, 
                    ((global.spawn_y div view_hview) * view_hview) + .5 * view_hview, objCamera);
                var o_player = instance_create(global.spawn_x, global.spawn_y, objPlayer);
                o_player.dir = global.spawn_dir;
            }
        break;
        case "ambience":
            var amb = instance_create(obj_x, obj_y, objAmbience);
            amb.bg = real(ds_map_find_value(obj, "bg"));
            amb.weather = real(ds_map_find_value(obj, "weather"));
        break;
        /*case "bubble":
            var bubble = instance_create(obj_x + 8, obj_y + 8, objPickupBubble);
            bubble.identifier = real(ds_map_find_value(obj, "id"));
        break;*/
        /*case "dragonScale":
            var scale = instance_create(obj_x + 8, obj_y + 8, objPickupDragonScale);
            scale.identifier = real(ds_map_find_value(obj, "id"));
            global.maxScales++;
        break;*/
        case "rune":
            var rune = instance_create(obj_x + 8, obj_y + 8, objPickupRune);
            rune.ability = real(ds_map_find_value(obj, "ability"));
        break;
        /*case "save":
            instance_create(obj_x + 8, obj_y + 8, objSave);
        break;*/
        case "enemy":
            var e = instance_create(obj_x + 8, obj_y + 8, objEnemySpawn);
            e.type = real(ds_map_find_value(obj, "enemyType"));
            e.shot_delay = real(ds_map_find_value(obj, "shot_delay"));
            e.shot_type = real(ds_map_find_value(obj, "shot_type"));
                        
            // visual move vars
            e.dir = real(ds_map_find_value(obj, "dir"));            
            e.movePattern = real(ds_map_find_value(obj, "movePattern"));
            
            // path offset
            e.x += real(ds_map_find_value(obj, "path_x"));
            e.y += real(ds_map_find_value(obj, "path_y"));

            // path stuff
            e.path_spd = real(ds_map_find_value(obj, "path_speed"));
            e.angle_offset = real(ds_map_find_value(obj, "angle_offset"));
            var path_str = string(ds_map_find_value(obj, "path"));
            var path_parts = string_split(path_str, "|");
            var path_precision = real(ds_map_find_value(obj, "path_precision"));
            var path_smooth = real(ds_map_find_value(obj, "path_smooth"));
            for(var path_i = 0; path_i < array_length_1d(path_parts); path_i++) {
                var path_p = string_split(path_parts[path_i], ",");
                var px = real(path_p[0]);
                var py = real(path_p[1]);
                var ps = 100;
                if (array_length_1d(path_p) > 2) {
                    ps = real(path_p[2]);
                }
                path_add_point(e.path, px, py, ps);
            }
            path_set_kind(e.path, path_smooth);
            path_set_precision(e.path, path_precision);
            path_set_closed(e.path, real(ds_map_find_value(obj, "path_closed")));
        break;
    }
}

