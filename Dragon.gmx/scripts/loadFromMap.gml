var _arr = string_split(ini_read_string("save", argument1, ""), "|");
ds_map_clear(argument0);
if (is_array(_arr)) {
    for(var i = 0; i < array_length_1d(_arr); i++) {
    
        var _spl = string_split(_arr[i], ":");
        if (is_array(_spl)) {
            ds_map_add(argument0, real(_spl[0]), _spl[1]);
        }
    }
}
