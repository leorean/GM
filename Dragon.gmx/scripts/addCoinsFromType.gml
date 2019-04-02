/// addCoinsFromType(type cointype);

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
