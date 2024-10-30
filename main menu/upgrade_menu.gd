extends Control

@onready var stat_name: Label = $screen/inside_window/group/upgrades_container/name
@onready var minus: TextureButton = $screen/inside_window/group/upgrades_container/minus
@onready var plus: TextureButton = $screen/inside_window/group/upgrades_container/plus
@onready var price: Label = $screen/inside_window/group/upgrades_container/price

@onready var test_label: Label = $screen/inside_window/group/test_label
@onready var test_label_2: Label = $screen/inside_window/group/test_label2


@onready var player_money_label: Label = $screen/inside_window/group/money_sprite/player_money_label

# -------------------
# READY, PROCESS AND PHYSICS
# -------------------

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	# Health 

	update_skill_1()
	player_money_label.text = str(Global.player_data.player_money) # money label
	
	
	
	
	#TEST
	test_label.text = str(upgrade_price_list)
	test_label_2.text = str(refund_list)
	
# -------------------
# all skills
# health
# health per second / health daemon 
# moement_speed
# range
# lifesteal
# invincibility skill
# more bullet , maybe press button and for 5 secconds , big bullet


# -------------------
# SKILL ONE  / HEALTH
# -------------------
var skill_one_name
var upgrade_price_list : Array = [8,12,24,47,86,122] 
var refund_list : Array = []

func update_skill_1():
	skill_one_name = "HP:" + str(Global.player_data.player_max_hp)
	stat_name.text = skill_one_name

	if upgrade_price_list.is_empty() == false:
		price.text = str(upgrade_price_list[0])
	else: price.text = "SOLDOUT"



func skill_pruchase(_skill_price:Array)-> void:
	if upgrade_price_list.is_empty() == false:
		Global.player_data.player_max_hp +=1
		Global.player_data.player_money -= _skill_price[0]
		refund_list.insert(0,upgrade_price_list[0])
		_skill_price.remove_at(0)
	else : 
		printerr("ITS EMPTY")
		
		
func skill_refund(_skill_price:Array)->void:
	if refund_list.is_empty() == false:
		Global.player_data.player_money += refund_list[0] # put money back into player
		upgrade_price_list.insert(0,refund_list[0]) # put refund price from refund list to upgrade list
		refund_list.remove_at(0) # remove 0 index
	else: print("cant refund")


func _on_minus_pressed() -> void:
	skill_refund(upgrade_price_list)
func _on_plus_pressed() -> void:
	if upgrade_price_list.is_empty() == false :
		if Global.player_data.player_money >= upgrade_price_list[0]:
			skill_pruchase(upgrade_price_list)
		else : 
			plus.disabled = true
			printerr("NOT ENOUGH MONEY HOE")
	else: pass



# -------------------
# SKILL TWO MOVEMENT SPEED %
# -------------------
