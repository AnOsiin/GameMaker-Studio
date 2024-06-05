// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerGotHit(_direction, _forge, _damage){
	if(OsPlayer.invulnerable <= 0){
		global.playerHealth = max (0, global.playerHealth - _damage);
		
		if(global.playerHealth > 0){
			with (OsPlayer){
				state = PlayerStateBonk;
				direction = _direction - 180;
				moveDistanceRemaining = _forge;
				ScrShake(2,10);
				flash = 0.7;
				invulnerable = 60;
			}
		} else {
			with(OsPlayer) state = PlayerStateDead;
		}
	}
}