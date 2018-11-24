/// loadSegment(levelmap, view_x, view_y);

var i0 = argument1;
var j0 = argument2;

var r_x = i0 div 16;
var r_y = j0 div 9;
if (global.ds_rooms[# r_x, r_y] == 1) {
    exit;
} else {
    global.ds_rooms[# r_x, r_y] = 1;
}

////////////////////////////////////////////////////

var data = argument0[0];
var objects = argument0[1];

var bg2 = 0;
var bg = 0;
var fg = 0;
var water = 0;
var obj = 0;

// tiles
for (var i = i0; i<(i0+16); i ++)
{
    for (var j = j0; j<(j0+9); j++)
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
                //global.maxScales++; <- workaround: do the counting already in the level import!
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

