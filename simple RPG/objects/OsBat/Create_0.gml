/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

sprMov = Bat_mov;
sprAttack = -1;
sprHit = Bat_hit;
sprDie = Bat_die;



enemyScript[ENEMYSTATE.WANDER] = BatWander;
enemyScript[ENEMYSTATE.CHASE] = BatChase;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.HIT] = BatHit;
enemyScript[ENEMYSTATE.DIE] = BatDie;



