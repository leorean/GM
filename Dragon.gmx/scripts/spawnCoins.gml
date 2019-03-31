/// spawnCoins(x, y, value);

var stack = argument2;
repeat(stack div coinvalue.C6) {
    spawnCoin(argument0, argument1, 6);
    stack -= coinvalue.C6;
}
repeat(stack div coinvalue.C5) {
    spawnCoin(argument0, argument1, 5);
    stack -= coinvalue.C5;
}
repeat(stack div coinvalue.C4) {
    spawnCoin(argument0, argument1, 4);
    stack -= coinvalue.C4;
}
repeat(stack div coinvalue.C3) {
    spawnCoin(argument0, argument1, 3);
    stack -= coinvalue.C3;
}
repeat(stack div coinvalue.C2) {
    spawnCoin(argument0, argument1, 2);
    stack -= coinvalue.C2;
}
repeat(stack div coinvalue.C1) {
    spawnCoin(argument0, argument1, 1);
    stack -= coinvalue.C1;
}
repeat(stack div coinvalue.C0) {
    spawnCoin(argument0, argument1, 0);
    stack -= coinvalue.C0;
}


