var _s = "";
for(var _i = 0; _i < argument_count; _i++) {
    _s += string(argument[_i]);
    if (_i < argument_count - 1) _s += " ";
}
show_debug_message(_s);
