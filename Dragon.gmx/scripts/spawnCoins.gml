/// spawnCoins(x, y, value, [chest]);

if (argument2 == 0) exit;

var chest = noone;
if (argument_count == 4) {
    chest = argument3;
}

var stack = argument2 - 1;
repeat(stack div coinvalue.C6) {
    spawnCoin(argument0, argument1, 6, chest);
    stack -= coinvalue.C6;
}
repeat(stack div coinvalue.C5) {
    spawnCoin(argument0, argument1, 5, chest);
    stack -= coinvalue.C5;
}
repeat(stack div coinvalue.C4) {
    spawnCoin(argument0, argument1, 4, chest);
    stack -= coinvalue.C4;
}
repeat(stack div coinvalue.C3) {
    spawnCoin(argument0, argument1, 3, chest);
    stack -= coinvalue.C3;
}
repeat(stack div coinvalue.C2) {
    spawnCoin(argument0, argument1, 2, chest);
    stack -= coinvalue.C2;
}
repeat(stack div coinvalue.C1) {
    spawnCoin(argument0, argument1, 1, chest);
    stack -= coinvalue.C1;
}
repeat(stack div coinvalue.C0) {
    spawnCoin(argument0, argument1, 0, chest);
    stack -= coinvalue.C0;
}

spawnCoin(argument0, argument1, 0, chest);


