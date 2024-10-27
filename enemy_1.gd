extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = %player

#------------
# STATS
#------------

var max_health : int = Global.enemy_1_data.base_health # change in global
var health_current : int = max_health 
var movement_speed : float = Global.enemy_1_data.movement_speed #change in global
var damage_taken : float = Global.player_data.bullet_damage # TODO add more bullets , change in global
#------------


#------------
# PROCESS
#------------
func _ready() -> void:
	pass
func _process(delta: float) -> void:
	animation_handler()
	enemy_death()
	
func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*movement_speed
	move_and_slide()
#------------

#------------
# BASIC ENEMEY FUNCTIONS
#------------

func enemy_death():
	if health_current <= 0:
		self.queue_free()
		Global.player_data.player_money += 1
		#TODO ADD LIFESTEAL HERE

func animation_handler():
	if velocity.x > 0:
		animated_sprite_2d.flip_h = false
	elif velocity.x < 0:
		animated_sprite_2d.flip_h = true

func take_damage():
	printerr("Take damage func : -"+str(damage_taken))
	health_current -= damage_taken
	knock_back(position)


func knock_back(_position):
	printerr("player: ",%player.position)
	printerr("enemy: ",_position)
	
