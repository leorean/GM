var _str = "";
var _key = -1;

for(var i = 0; i < ds_map_size(argument0); i++) {

    if (_key == -1) 
        _key = ds_map_find_first(argument0);
    else    
        _key  = ds_map_find_next(argument0, _key);
        
    if (_key == undefined)
        break;
        
    var val = ds_map_find_value(argument0, _key);
    
    _str += string(_key) + ":" + string(val);
    
    if (i < ds_map_size(argument0) - 1) {
        _str += "|";
    }
}

ini_write_string("save", argument1, _str);

