state = PlayerStateFree;
stateAttack = AttackSla;
hitByAttack = -1;
lastState = state;
skipStepEvent = false;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalking = 2.0;
z = 0;

speedHook = 3.0;
distanceHook = 88;
hook = 0;
hookX = 0;
hookY = 0;
hookSize = sprite_get_width(HookChains);

speedPush = 0.5;

//textBoxDelay = 0;

grapped = noone;




invulnerable = 0;
flash = 0;
flashShader = shWhiteFlash;

speedBonk = 3.0;
distanceBonk = 40;
moveDistanceRemaining = 0;

animationEndScripts = -1;
sIdle = Player_idle_all;
sWalking = Player_walk_all;
localFrame = 0;

if(global.targetX != -1){
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirecttion;
}

if(global.iLift != noone){
	sIdle = Player_hold_idle_all;
	sWalking = Player_hold_walk_all;
	sprite_index = sIdle;
}
