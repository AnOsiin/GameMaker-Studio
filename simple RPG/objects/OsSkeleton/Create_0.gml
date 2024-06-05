/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

sprMov = Skeleton_walk;
sprAttack = Skeleton_attack;
sprHit = Skeleton_takingDamage;
sprDie = Skeleton_die;



enemyScript[ENEMYSTATE.WANDER] = SkeletonWander;
enemyScript[ENEMYSTATE.CHASE] = SkeletonChase;
enemyScript[ENEMYSTATE.ATTACK] = SkeletonAttack;
enemyScript[ENEMYSTATE.HIT] = SlimeHit;
enemyScript[ENEMYSTATE.DIE] = SlimeDie;



