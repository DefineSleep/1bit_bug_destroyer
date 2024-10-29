extends Node

var enemies_killed : int 

var player_data : Dictionary = {
	
	"player_max_hp" : 50,
	"player_money" : 1000,
	"player_movement_speed" : 100,
	"current_bullet_type" : "res://bullet.tscn",
	"bullet_damage" : 25,
	"attack_speed" : 1, # attack speed is set per second , 1 == 1 attack per second
	"player_range" : 50, # shooting range
	"bullet_speed" : 50 
}

var enemy_1_data : Dictionary = {
	"enemy_spawn_rate" : "TBD",
	"base_health" : 100,
	"movement_speed" : 50
}


var all_bullets : Dictionary = {}

var level_data : Dictionary = {
	"level_1" : {},
	"level_2" : {},
	# ETC
	
}
