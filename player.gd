extends CharacterBody2D

signal health_depleted

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var health_bar: TextureProgressBar = $Camera2D/HUD/TextureProgressBar
@onready var dps_timer: Timer = $dps_timer



var char_speed : int = Global.player_data.player_movement_speed
var last_direction : Vector2 

var current_health : int = Global.player_data.player_max_hp

func _physics_process(delta):
	get_better_inputs()
	var damage_rate = 5 # TODO:ADD GLOBAL LINK HERE
	var overlapping_mobs = %hurt_box.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		current_health -= damage_rate * overlapping_mobs.size() * delta
		if current_health <= 0:
			health_depleted.emit()
	update_health()




#---------------------
# MOVEMENT
#---------------------
func get_better_inputs()->void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if input_direction.x == 1 : 
		animated_sprite.flip_h = true
	if input_direction.x == -1 : 
		animated_sprite.flip_h = false
	velocity = input_direction * char_speed
	move_and_slide()
#---------------------
# ADDING LIFESTEAL
#---------------------
func lifesteal():
	pass

#---------------------
# HEALTH AND TIME DOWN MECHANIC
#---------------------

func update_health():
	health_bar.min_value = 0
	health_bar.max_value = Global.player_data.player_max_hp
	health_bar.value = current_health
	#printerr("Min | Max | C")
	#printerr("|",health_bar.max_value,"|",health_bar.min_value,"|", health_bar.value) # debug

func take_DPS():
	current_health -= 1 # TODO change to variable difficulty_rating from global

# can use timer , every X amount of time , take Y amount of damage


func _on_dps_timer_timeout() -> void:
	take_DPS()

#-------------
# GAME OVER
#-------------
