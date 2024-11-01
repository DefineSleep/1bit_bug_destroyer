extends Node2D

@onready var level_timer: Timer = $player/level_timer
@onready var health_bar: TextureProgressBar = $player/Camera2D/HUD/TextureProgressBar

@onready var time_label: Label = $player/Camera2D/HUD/test_label
@onready var player: CharacterBody2D = $player
@onready var money_label: Label = $player/Camera2D/HUD/money_label

@onready var spawn_timer: Timer = $player/spawn_timer
@onready var spawn_timer_2: Timer = $player/spawn_timer2



@onready var wait_timer: Label = $game_over_window/Control/VBoxContainer/wait_timer_label

@onready var fps_label: Label = $player/Camera2D/HUD/fps_label


var game_over : bool = false

var seconds : int 
var minutes : int 
var hours : int

var current_health = Global.player_data.player_max_hp

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	spawn_timer.wait_time = Global.enemy_1_data.enemy_spawn_rate
	fps_label.text = 'FPS: '+str(Engine.get_frames_per_second())
	# labels
	time_label.text = str(hours).pad_zeros(2)+":"+ str(minutes).pad_zeros(2) +":"+ str(seconds).pad_zeros(2)
	money_label.text = str(Global.player_data.player_money)
	if Input.is_physical_key_pressed(KEY_ESCAPE):
		show_pause()




#-------------
# TIME SYSTEM, USED FOR HEALTH 
#-------------
func _on_level_timer_timeout() -> void:
	seconds += 1
	if seconds == 60 :
		minutes +=1
		seconds = 0
	if minutes == 60 :
		hours +=1
		minutes = 0


#-------------
# ENEMY SPAWN SYSTEM
#-------------
#TODO INCREMENT SPAWN AND ADD VARIABLES

const ENEMY_2 = preload("res://enemy_2.tscn")

func spawn_system():
	if minutes >= 1:
		spawn_timer_2.start()




func spawn_enemy():
	var enemy_1 = preload("res://enemy_1.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	enemy_1.global_position = %PathFollow2D.global_position
	add_child(enemy_1)
	


func spawn_enemy_better(_enemy_scene):
	var enemy_1 = _enemy_scene.instantiate()
	%PathFollow2D.progress_ratio = randf()
	enemy_1.global_position = %PathFollow2D.global_position
	add_child(enemy_1)

func _on_spawn_timer_timeout() -> void:
	spawn_enemy()

func _on_spawn_timer_2_timeout() -> void:
	pass # Replace with function body.


#-------------
# GAME OVER AND SHIT
#-------------
@onready var game_over_shade: CanvasLayer = $game_over_shade
@onready var game_over_window: Window = $game_over_window

func show_gameover():
	game_over_window.show()
	game_over_shade.show()
	get_tree().paused = true

func _on_player_health_depleted() -> void:
	show_gameover()


func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main menu/main_menu.tscn")


#-------------
# PAUSE MENU AND SHIT
#-------------
@onready var pause_menu: Window = $pause_menu

func show_pause():
	pause_menu.show()
	get_tree().paused = true


func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main menu/main_menu.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_unpause_pressed() -> void:
		get_tree().paused = false
		pause_menu.hide()
