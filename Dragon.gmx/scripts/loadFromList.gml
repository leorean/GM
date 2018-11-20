var _arr = string_split(ini_read_string("save", argument1, ""), "|");
ds_list_clear(argument0);
if (is_array(_arr)) {
    for(var i = 0; i < array_length_1d(_arr); i++) {
        ds_list_add(argument0, real(_arr[i]));
    }
}
