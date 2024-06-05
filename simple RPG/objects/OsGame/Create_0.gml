randomize();

//Game data
global.gameSaveSlot = 0;

global.gamePause = false;
global.textSpeed = 0.75; 

global.targetRooom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirecttion = 0;

global.playerHealthMax = 3;
global.playerHealth = global.playerHealthMax;
global.playerMoney = 0;

//item
global.playerHasAnyItems = false;
global.playerEqui = ITEMS.BOMB;
global.playerAmmo = array_create(ITEMS.TYPE_COUNT, -1);
global.playerItemsUnlock = array_create(ITEMS.TYPE_COUNT, false);

//quest
global.questStatus = ds_map_create();
global.questStatus [? "Find my hat"] = 0;


//temp
/*global.playerAmmo[ITEMS.BOMB] = 0;
global.playerAmmo[ITEMS.BOW] = 0;
global.playerItemsUnlock[ITEMS.BOMB] = true;
global.playerHasAnyItems = true;
global.playerAmmo[ITEMS.BOMB] = 5;
global.playerItemsUnlock[ITEMS.BOW] = true;
global.playerAmmo[ITEMS.BOW] = 15;
global.playerItemsUnlock[ITEMS.HOOK] = true;
global.playerMoney = 1000;
//*/

global.iLift = noone;
global.iCamera = instance_create_layer(0, 0, layer, OsCamera)
global.iUI = instance_create_layer(0, 0, layer, OsUI)

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
room_goto(ROOM_START);