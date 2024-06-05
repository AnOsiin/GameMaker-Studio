/// @description Insert description here
// You can write your code in this editor
event_inherited();

state = ENEMYSTATE.IDLE;
hSpeed = 0;
vSpeed = 0; 
xTo	= xstart;
yTo = ystart;
dir = 0;

aggroCheck = 0;
aggroCheckDura = 5;

stateTarget = state;
statePrevious = state;
stateWait = 0;
stateWairDura = 0;

timePassed = 0;
waitDura = 60;
wait = 0;


//Enemy sprites
sprMov = Skeleton_walk;

//Enemy script
enemyScript[ENEMYSTATE.IDLE] = -1
enemyScript[ENEMYSTATE.WANDER] = -1
enemyScript[ENEMYSTATE.CHASE] = -1
enemyScript[ENEMYSTATE.ATTACK] = -1
enemyScript[ENEMYSTATE.HIT] = -1
enemyScript[ENEMYSTATE.DIE] = -1
enemyScript[ENEMYSTATE.WAIT] = EnemyWait;




