extends Node

var monster_buff_25 = false
var monster_buff_75 = false


func _process(delta: float) -> void:
	if Global.env_soc_gauge < 25:
		monster_buff_25 = true
		monster_buff_75 = false
	elif Global.env_soc_gauge > 75:
		monster_buff_75 = true
		monster_buff_25 = false
	else:
		monster_buff_25 = false
		monster_buff_75 = false


func _ready() -> void:
	pass


func _on_end_turn_button_pressed() -> void:
	monster_turn()


func monster_turn():
	Global.monster_turn = true
	# Start opponent turn : disable/hide button + prevent action from player
	$"../EndTurnButton".disabled = true
	$"../EndTurnButton".visible = false
	
	# Wait opponent finish action
	await get_tree().create_timer(1).timeout
	
	
	
	if monster_buff_25 or monster_buff_75:
		if randf() < 0.1:
			# Monster basic attack
			monster_basic_attack()
			await get_tree().create_timer(2).timeout
		else:
			# Monster big atack
			monster_big_attack()
			await get_tree().create_timer(4).timeout
	else:
		if randf() < 0.7:
			# Monster basic attack
			monster_basic_attack()
			await get_tree().create_timer(2).timeout
		else:
			# Monster big atack
			monster_big_attack()
			await get_tree().create_timer(4).timeout
	
	
	end_monster_turn()


func monster_basic_attack():
	$"../Enemy2/BasicAttack/BasicAttackMove".play("AttackMove")
	await get_tree().create_timer(1).timeout
	$"../MonsterBaseAttack".play()
	#battle_timer1s.start()
	#await battle_timer1s.timeout
	
	# HP damage
	#$"../PlayerHealth".health_damage(5)
	
	# Turn reduce
	#$"../TurnGauge".set_turn_down(1)
	
	# Round turn
	await get_tree().create_timer(1).timeout
	$"../RoundTurnGauge".set_turn_up(1)


func monster_big_attack():
	$"../Enemy2/BigAttack/BigAttackMove".play("BigAttack")
	await get_tree().create_timer(2).timeout
	$"../MonsterBigAttack".play()
	#battle_timer3s.start()
	#await battle_timer3s.timeout
	
	# HP damage
	#await get_tree().create_timer(1).timeout
	#$"../PlayerHealth".health_damage(15)
	
	# Turn reduce
	#await get_tree().create_timer(2.5).timeout
	#$"../TurnGauge".set_turn_down(2)
	
	# Round turn
	await get_tree().create_timer(2.5).timeout
	$"../RoundTurnGauge".set_turn_up(1)
	await get_tree().create_timer(0.5).timeout
	$"../RoundTurnGauge".set_turn_up(1)


func end_monster_turn():
	# End monster turn
	if $"../PlayerHand".player_hand.size() > 6:
		pass
	else:
		$"../Deck2".draw_card()
	$"../Mana".reset_mana()
	await get_tree().create_timer(0.5).timeout
	if $"../PlayerHand".player_hand.size() > 6:
		pass
	else:
		$"../Deck2".draw_card()
	await get_tree().create_timer(1).timeout
	if monster_buff_25 and $"../PlayerHand".player_hand.size() > 0:
		$"../PlayerHand".player_hand[int(randi_range(0, $"../PlayerHand".player_hand.size()-1))].visible = false
	$"../EndTurnButton".disabled = false
	$"../EndTurnButton".visible = true
	Global.monster_turn = false


#func _on_button_pressed() -> void:
	#get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
