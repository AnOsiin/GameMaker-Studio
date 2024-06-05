/// @description Essential Entity setup
// You can write your code in this editor
z = 0;
flash = 0;
lifted = 0;
thrown = false;

spd = 0;

//flash on hit
blend = image_blend
blendtime = 0;

flashShader = shWhiteFlash;
uFlash = shader_get_uniform(flashShader,"flash");
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

//drop
eDropList = -1;

//Chest
chestTriggerd = false;
chestOpened = false;




