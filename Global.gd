extends Node

var enemies_killed : int 

var player_data : Dictionary = {
	
	"player_max_hp" : 50,
	"player_money" : 100000,
	"player_movement_speed" : 100,
	"current_bullet_type" : "res://bullet.tscn",
	"bullet_damage" : 25,
	"attack_speed" : 1, # attack speed is set per second , 1 == 1 attack per second
	"player_range" : 50, # shooting range
	"bullet_speed" : 50 
}

var enemy_1_data : Dictionary = {
	"enemy_spawn_rate" : 1, # per second
	"base_health" : 100,
	"movement_speed" : 50
}


var enemy_boss_data : Dictionary = {
	
	
}




var all_bullets : Dictionary = {}

var level_data : Dictionary = {
	"level_1" : {},
	"level_2" : {},
	# ETC
	
}

# -------------------
# SKILLS VARIABLES
# -------------------

# skill 1
var upgrade_price_list : Array = [8,12,24,47,86,122] 
var refund_list : Array = []
var upgrade_list : Array = [1,1,1,1,1,1]
var refund_upgrade : Array = []

# skill 2
var upgrade_price_list_skill_2 :Array = [1,2,3,4,5,6,7] #TODO BALANCE PATCH
var refund_list_skill_2 : Array = []
var upgrade_list_skill_2 : Array = [1,2,3,4,5,6,7]
var refund_upgrade_skill_2 : Array = []

# skill 3 
var upgrade_price_list_skill_3 : Array = [100,200,300,400,500,600] # TODO BALANCE PATCH
var refund_list_skill_3 : Array = []
var upgrade_list_skill_3 : Array = [2,4,8,16,32,64,128]
var refund_upgrade_skill_3 : Array = []

# SKILL 4 
var upgrade_price_list_skill_4 : Array = [1,2,3,4,5,6,7] # TODO BALANCE PATCH
var refund_list_skill_4 : Array = []
var upgrade_list_skill_4 : Array = [0.1,0.1,0.1,0.1,0.1,0.1,0.1]
var refund_upgrade_skill_4 : Array = []
