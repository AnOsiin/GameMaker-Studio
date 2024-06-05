/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

sprMov = Slime_nonAttk_walk;
sprAttack = -1;
sprHit = Slime_nonAttk_hit;
sprDie = Slime_nonAttk_die;



enemyScript[ENEMYSTATE.WANDER] = Slime_nonAttk_Wander;
enemyScript[ENEMYSTATE.CHASE] = Slime_nonAttk_Chase;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.HIT] = Slime_nonAttk_Hit;
enemyScript[ENEMYSTATE.DIE] = Slime_nonAttk_Die;



