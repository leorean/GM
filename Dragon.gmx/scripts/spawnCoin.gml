var chest = noone;
if (argument_count == 4) {
    chest = argument3;
}

var _coin = instance_create(argument0, argument1, objPickupCoin);
_coin.xVel = -1+random(2);
_coin.yVel = -1-random(1);
_coin.fixed = false;
_coin.type = argument2;
_coin.chest = chest;
