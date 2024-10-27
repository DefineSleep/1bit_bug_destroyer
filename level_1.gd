extends Node2D

@onready var level_timer: Timer = $player/level_timer
@onready var health_bar: TextureProgressBar = $player/Camera2D/HUD/TextureProgressBar

@onready var time_label: Label = $player/Camera2D/HUD/test_label

var seconds : int 
var minutes : int 
var hours : int

var current_health = Global.player_data.player_max_hp

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	time_label.text = str(hours).pad_zeros(2)+":"+ str(minutes).pad_zeros(2) +":"+ str(seconds).pad_zeros(2)



func _on_level_timer_timeout() -> void:
	seconds += 1
	if seconds == 60 :
		minutes +=1
		seconds = 0
	if minutes == 60 :
		hours +=1
		minutes = 0
