extends Area2D



@onready var attack_speed_timer: Timer = $attack_speed
@onready var marker_2d: Marker2D = $weapon_pivot/Sprite2D/Marker2D


#-------
func _ready() -> void:
	pass 
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	
	var targeted_enemy = get_closest_group_member("enemy")
	if targeted_enemy != null:
		look_at(targeted_enemy.global_position)
	attack_speed_timer.wait_time = Global.player_data.attack_speed # Attack speed

#-------
func shoot():
	var BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = marker_2d.global_position
	new_bullet.global_rotation = marker_2d.global_rotation
	marker_2d.add_child(new_bullet)


func _on_attack_speed_timeout() -> void:
	shoot()
	printerr("shooting")



func get_closest_group_member(_group_name: String) -> Node2D:
	var closest_member: Node2D = null
	var closest_distance: float = INF # start with large distance (INF = infinity)
	var my_position:Vector2 = global_position # get position of current node
	
	for member in get_tree().get_nodes_in_group(_group_name): # iterate through all members 
		if member is Node2D: #make sure its a node2d
			var member_position: Vector2 = member.global_position
			var distance_to_member: float = my_position.distance_to(member_position)
			if distance_to_member < closest_distance: # check who is closer
				closest_distance = distance_to_member
				closest_member = member
	
	return closest_member
