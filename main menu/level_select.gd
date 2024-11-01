extends Control
const LEVEL_1 = preload("res://level_1.tscn")
@onready var icon_1: TextureButton = $inside_window/GridContainer/icon_1
@onready var title_1: Button = $inside_window/GridContainer/title_1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_icon_1_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL_1)


func _on_title_1_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL_1)
