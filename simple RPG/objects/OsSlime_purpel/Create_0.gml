/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

sprMov = Slime_purpel_walk;
sprAttack = Slime_purpel_attack;
sprHit = Slime_purpel_hit;
sprDie = Slime_purpel_die;



enemyScript[ENEMYSTATE.WANDER] = SlimeWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
enemyScript[ENEMYSTATE.ATTACK] = Slime_purpelAttack;
enemyScript[ENEMYSTATE.HIT] = SlimeHit;
enemyScript[ENEMYSTATE.DIE] = SlimeDie;



