// putting the crate's origin at middle center allows us to spawn
// the poof directly in the middle as well
instance_create_layer(x, y, "CollectiblesLayer", obj_crate_poof);

/*
var coins = random_range(4, 8);

for (var i = 0; i < coins; ++i)
    instance_create(x + 8, y + 8, oCoin);
*/
