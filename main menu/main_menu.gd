extends Control

const UPGRADE_MENU = preload("res://main menu/upgrade_menu.tscn")
const LEVEL_1 = preload("res://level_1.tscn")
const LEVEL_SELECT = preload("res://main menu/level_select.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_debug_text_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL_SELECT)


func _on_upgrades_text_pressed() -> void:
	get_tree().change_scene_to_packed(UPGRADE_MENU)
