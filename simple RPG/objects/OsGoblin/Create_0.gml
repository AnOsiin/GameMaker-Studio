/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

sprMov = Goblin_green_walk;
sprAttack = Goblin_green_attack;
sprHit = Goblin_green_hit;
sprDie = Goblin_green_die;



enemyScript[ENEMYSTATE.WANDER] = SkeletonWander;
enemyScript[ENEMYSTATE.CHASE] = SkeletonChase;
enemyScript[ENEMYSTATE.ATTACK] = SkeletonAttack;
enemyScript[ENEMYSTATE.HIT] = SlimeHit;
enemyScript[ENEMYSTATE.DIE] = SlimeDie;



