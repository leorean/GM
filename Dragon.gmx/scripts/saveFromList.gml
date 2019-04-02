var _str = "";
for(var i = 0; i < ds_list_size(argument0); i++) {
    _str += string(ds_list_find_value(argument0, i));
    if (i < ds_list_size(argument0) - 1) {
        _str += "|";
    }
}
ini_write_string("save", argument1, _str);
