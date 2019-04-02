/// addCoinsFromType(type cointype, chest);

var _coinValue = 0;
switch(argument0) {
    case 0:
        _coinValue = coinvalue.C0;
    break;
    case 1:
        _coinValue = coinvalue.C1;
    break;
    case 2:
        _coinValue = coinvalue.C2;
    break;
    case 3:
        _coinValue = coinvalue.C3;
    break;
    case 4:
        _coinValue = coinvalue.C4;
    break;
    case 5:
        _coinValue = coinvalue.C5;
    break;
    case 6:
        _coinValue = coinvalue.C6;
    break;    
}

global.coins += _coinValue;
global.coinsCollected += _coinValue;

if (argument1 != noone) {

    var ch = ds_map_find_value(global.ds_openchests, argument1);
    var val = _coinValue;
    if (ch != undefined) {
        val += real(ch);
        ds_map_delete(global.ds_openchests, argument1);        
    }
    ds_map_add(global.ds_openchests, argument1, val);
}
