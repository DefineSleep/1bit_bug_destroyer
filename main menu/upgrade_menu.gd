extends Control



@onready var stat_name: Label = $screen/inside_window/group/upgrades_container/name
@onready var minus: TextureButton = $screen/inside_window/group/upgrades_container/minus
@onready var plus: TextureButton = $screen/inside_window/group/upgrades_container/plus
@onready var price: Label = $screen/inside_window/group/upgrades_container/price
# -------------------
@onready var name_2: Label = $screen/inside_window/group/upgrades_container/name2
@onready var minus_2: TextureButton = $screen/inside_window/group/upgrades_container/minus2
@onready var price_2: Label = $screen/inside_window/group/upgrades_container/price2
@onready var plus_2: TextureButton = $screen/inside_window/group/upgrades_container/plus2
# -------------------
@onready var name_3: Label = $screen/inside_window/group/upgrades_container/name3
@onready var minus_3: TextureButton = $screen/inside_window/group/upgrades_container/minus3
@onready var price_3: Label = $screen/inside_window/group/upgrades_container/price3
@onready var plus_3: TextureButton = $screen/inside_window/group/upgrades_container/plus3
# -------------------
@onready var name_4: Label = $screen/inside_window/group/upgrades_container/name4
@onready var minus_4: TextureButton = $screen/inside_window/group/upgrades_container/minus4
@onready var price_4: Label = $screen/inside_window/group/upgrades_container/price4
@onready var plus_4: TextureButton = $screen/inside_window/group/upgrades_container/plus4
# -------------------
@onready var test_label: Label = $CanvasLayer/test_label
@onready var test_label_2: Label = $CanvasLayer/test_label2
@onready var test_label_3: Label = $CanvasLayer/test_label3
@onready var test_label_4: Label = $CanvasLayer/test_label4
@onready var test_label_5: Label = $CanvasLayer/test_label5
@onready var test_label_6: Label = $CanvasLayer/test_label6
@onready var test_label_7: Label = $CanvasLayer/test_label7
@onready var test_label_8: Label = $CanvasLayer/test_label8




# -------------------
@onready var player_money_label: Label = $screen/inside_window/group/money_sprite/player_money_label
# -------------------




# -------------------
# READY, PROCESS AND PHYSICS
# -------------------

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	# Health 
	update_skill_4()
	update_skill_3()
	update_skill_2()
	update_skill_1()
	player_money_label.text = str(Global.player_data.player_money) # money label

	
	
	#TEST
	test_label.text = "PRICE_LIST 1"+str(Global.upgrade_price_list_skill_4)
	test_label_2.text = "REFUND_LIST_1"+str(Global.refund_list_skill_4)
	test_label_3.text = "UPGRADE_list" + str(Global.upgrade_list_skill_4)
	test_label_4.text = "REFUND UPGRADE"+str(Global.refund_upgrade_skill_4)
	
	test_label_5.text = "PRICE_LIST 2"+str(Global.upgrade_price_list_skill_2)
	test_label_6.text = "REFUND_LIST_2"+str(Global.refund_list_skill_2)
	test_label_7.text = "UPGRADE_list2" + str(Global.upgrade_list_skill_2)
	test_label_8.text = "REFUND UPGRADE2"+str(Global.refund_upgrade_skill_2)
	

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main menu/main_menu.tscn")

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



func update_skill_1():
	stat_name.text = "HP:" + str(Global.player_data.player_max_hp)
	if Global.upgrade_price_list.is_empty() == false:
		price.text = "$"+str(Global.upgrade_price_list[0])
	else: price.text = "SOLDOUT"

func skill_pruchase()-> void:
	if Global.upgrade_price_list.is_empty() == false:
		Global.player_data.player_max_hp += Global.upgrade_list[0]
		Global.player_data.player_money -= Global.upgrade_price_list[0]
		Global.refund_upgrade.insert(0,Global.upgrade_list[0])
		Global.refund_list.insert(0,Global.upgrade_price_list[0])
		Global.upgrade_list.remove_at(0)
		Global.upgrade_price_list.remove_at(0)
	else : 
		printerr("ITS EMPTY")

func skill_refund()->void:
	if Global.refund_list.is_empty() == false:
		Global.player_data.player_money += Global.refund_list[0] # put money back into player
		Global.player_data.player_max_hp -= Global.refund_upgrade[0] #remove hp
		Global.upgrade_list.insert(0, Global.refund_upgrade[0])
		Global.upgrade_price_list.insert(0,Global.refund_list[0]) # put refund price from refund list to upgrade list
		Global.refund_list.remove_at(0) # remove 0 index
		Global.refund_upgrade.remove_at(0)
	else: print("cant refund")
# ------------------- 
# button presses
# -------------------
func _on_minus_pressed() -> void:
	skill_refund()
func _on_plus_pressed() -> void:
	if Global.upgrade_price_list.is_empty() == false :
		if Global.player_data.player_money >= Global.upgrade_price_list[0]:
			skill_pruchase()
		else : 
			plus.disabled = true
			printerr("NOT ENOUGH MONEY HOE")
	else: pass



# -------------------
# SKILL TWO MOVEMENT SPEED %
# -------------------

# name_2,minus_2,plus_2,price_2

func update_skill_2():
	name_2.text = "MS:"+ str(Global.player_data.player_movement_speed)
	if Global.upgrade_price_list_skill_2.is_empty() == false:
		price_2.text = "$"+str(Global.upgrade_price_list_skill_2[0])
	else: price_2.text = "SOLDOUT"

func skill_2_purchase():
	if Global.upgrade_price_list_skill_2.is_empty() == false:
		Global.player_data.player_movement_speed += Global.upgrade_list_skill_2[0]
		Global.player_data.player_money -= Global.upgrade_price_list_skill_2[0]
		Global.refund_upgrade_skill_2.insert(0,Global.upgrade_list_skill_2[0])
		Global.refund_list_skill_2.insert(0,Global.upgrade_price_list_skill_2[0])
		Global.upgrade_list_skill_2.remove_at(0)
		Global.upgrade_price_list_skill_2.remove_at(0)
	else : 
		printerr("ITS EMPTY")
	
func skill_2_refund():
	if Global.refund_list_skill_2.is_empty() == false:
		Global.player_data.player_money += Global.refund_list_skill_2[0] # put money back into player
		Global.player_data.player_movement_speed -= Global.refund_upgrade_skill_2[0] #remove hp
		Global.upgrade_list_skill_2.insert(0, Global.refund_upgrade_skill_2[0])
		Global.upgrade_price_list_skill_2.insert(0,Global.refund_list_skill_2[0]) # put refund price from refund list to upgrade list
		Global.refund_list_skill_2.remove_at(0) # remove 0 index
		Global.refund_upgrade_skill_2.remove_at(0)
	else: print("cant refund")

# button presses
func _on_minus_2_pressed() -> void:
	skill_2_refund()


func _on_plus_2_pressed() -> void:
	skill_2_purchase()


# -------------------
# SKILL THREE RANGE
# -------------------

func update_skill_3():
	name_3.text = "RANGE:"+ str(Global.player_data.player_range)
	if Global.upgrade_price_list_skill_3.is_empty() == false:
		price_3.text = "$"+str(Global.upgrade_price_list_skill_3[0])
	else: price_3.text = "SOLDOUT"
	
	
func skill_3_purchase():
	if Global.upgrade_price_list_skill_3.is_empty() == false:
		Global.player_data.player_range += Global.upgrade_list_skill_3[0]
		Global.player_data.player_money -= Global.upgrade_price_list_skill_3[0]
		Global.refund_upgrade_skill_3.insert(0,Global.upgrade_list_skill_3[0])
		Global.refund_list_skill_3.insert(0,Global.upgrade_price_list_skill_3[0])
		Global.upgrade_list_skill_3.remove_at(0)
		Global.upgrade_price_list_skill_3.remove_at(0)
	else : 
		printerr("ITS EMPTY")
func skill_3_refund():
	if Global.refund_list_skill_3.is_empty() == false:
		Global.player_data.player_money += Global.refund_list_skill_3[0] # put money back into player
		Global.player_data.player_range-= Global.refund_upgrade_skill_3[0] #remove hp
		Global.upgrade_list_skill_3.insert(0, Global.refund_upgrade_skill_3[0])
		Global.upgrade_price_list_skill_3.insert(0,Global.refund_list_skill_3[0]) # put refund price from refund list to upgrade list
		Global.refund_list_skill_3.remove_at(0) # remove 0 index
		Global.refund_upgrade_skill_3.remove_at(0)
	else: print("cant refund")
	

func _on_minus_3_pressed() -> void:
	skill_3_refund()


func _on_plus_3_pressed() -> void:
	skill_3_purchase()

# -------------------
# SKILL FOUR  ATTACK SPEED
# -------------------

func update_skill_4():
	name_4.text = "AS:"+ str(Global.player_data.attack_speed)
	if Global.upgrade_price_list_skill_4.is_empty() == false:
		price_4.text = "$"+str(Global.upgrade_price_list_skill_4[0])
	else: price_4.text = "SOLDOUT"
	
func skill_4_purchase():
	if Global.upgrade_price_list_skill_4.is_empty() == false:
		Global.player_data.attack_speed -= Global.upgrade_list_skill_4[0]
		Global.player_data.player_money -= Global.upgrade_price_list_skill_4[0]
		Global.refund_upgrade_skill_4.insert(0,Global.upgrade_list_skill_4[0])
		Global.refund_list_skill_4.insert(0,Global.upgrade_price_list_skill_4[0])
		Global.upgrade_list_skill_4.remove_at(0)
		Global.upgrade_price_list_skill_4.remove_at(0)
	else : 
		printerr("ITS EMPTY")
	
func skill_4_refund():
	if Global.refund_list_skill_4.is_empty() == false:
		Global.player_data.player_money += Global.refund_list_skill_4[0] # put money back into player
		Global.player_data.attack_speed += Global.refund_upgrade_skill_4[0] #remove hp
		Global.upgrade_list_skill_4.insert(0, Global.refund_upgrade_skill_4[0])
		Global.upgrade_price_list_skill_4.insert(0,Global.refund_list_skill_4[0]) # put refund price from refund list to upgrade list
		Global.refund_list_skill_4.remove_at(0) # remove 0 index
		Global.refund_upgrade_skill_4.remove_at(0)
	else: print("cant refund")
	
func _on_minus_4_pressed() -> void:
	skill_4_refund()


func _on_plus_4_pressed() -> void:
	skill_4_purchase()


# -------------------
# SKILL FIVE BULLET SPEED
# -------------------


# -------------------
# CHANGE BULLET TYPE
# -------------------
