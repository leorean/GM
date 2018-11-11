var _a,_b,_n,_r;

draw_set_blend_mode(bm_add);
draw_set_alpha(0.2);

_r = 3;
_w = choose(1, 1);
_n = max(
    max(abs(argument0-argument2),abs(argument1-argument3)) div 4
    , 3);
_a[0] = argument0;
_b[0] = argument1;
_a[_n] = argument2;
_b[_n] = argument3;
_color = choose(c_white, make_color_hsv(120+random(25), 255, 255));


for (i = 1; i <= _n; i+=1)
{
    _a[i] = _a[0] + i/_n*(_a[_n]-_a[0]) - _r + random(2*_r);
    _b[i] = _b[0] + i/_n*(_b[_n]-_b[0]) - _r + random(2*_r);

    draw_set_color(_color);    
    draw_line_width(_a[i-1],_b[i-1],_a[i],_b[i], _w);    
}

draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
draw_set_color(c_white);
