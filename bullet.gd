extends Area2D



var travel_distance = 0
#-------
func _ready() -> void:
	pass 
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	var attack_range = Global.player_data.player_range
	var speed = Global.player_data.bullet_speed
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	travel_distance += speed * delta
	if travel_distance > attack_range:
		queue_free()
#-------




func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
