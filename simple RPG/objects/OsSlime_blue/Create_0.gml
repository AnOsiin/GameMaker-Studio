/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

sprMov = SlimeWalk;
sprAttack = SlimeAttacks;
sprHit = SlimeHits;
sprDie = SlimeDies;



enemyScript[ENEMYSTATE.WANDER] = SlimeWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack;
enemyScript[ENEMYSTATE.HIT] = SlimeHit;
enemyScript[ENEMYSTATE.DIE] = SlimeDie;



