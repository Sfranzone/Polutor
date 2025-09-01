extends Node

var battle_timer1s
var battle_timer2s
var battle_timer3s
var battle_timer4s


func _ready() -> void:
	battle_timer1s = $"../BattleTimer1"
	battle_timer1s.one_shot = true
	battle_timer1s.wait_time = 1.0
	battle_timer2s = $"../BattleTimer2"
	battle_timer2s.one_shot = true
	battle_timer2s.wait_time = 2.0
	battle_timer3s = $"../BattleTimer3"
	battle_timer3s.one_shot = true
	battle_timer3s.wait_time = 3.0
	battle_timer4s = $"../BattleTimer4"
	battle_timer4s.one_shot = true
	battle_timer4s.wait_time = 4.0


func _on_end_turn_button_pressed() -> void:
	monster_turn()


func monster_turn():
	# Start opponent turn : disable/hide button + prevent action from player
	$"../EndTurnButton".disabled = true
	$"../EndTurnButton".visible = false
	
	# Wait opponent finish action
	battle_timer1s.start()
	await battle_timer1s.timeout
	
	if randf() < 0.7:
		# Monster basic attack
		monster_basic_attack()
		battle_timer2s.start()
		await battle_timer2s.timeout
	else:
		# Monster big atack
		monster_big_attack()
		battle_timer4s.start()
		await battle_timer4s.timeout
	
	
	end_monster_turn()


func monster_basic_attack():
	$"../Enemy2/BasicAttack/BasicAttackMove".play("AttackMove")
	await get_tree().create_timer(1).timeout
	$"../MonsterBaseAttack".play()
	#battle_timer1s.start()
	#await battle_timer1s.timeout
	if Global.env_soc_gauge < 25 or Global.env_soc_gauge > 75:
		$"../PlayerHealth".health_damage(10)
	else:
		$"../PlayerHealth".health_damage(5)


func monster_big_attack():
	$"../Enemy2/BigAttack/BigAttackMove".play("BigAttack")
	await get_tree().create_timer(2).timeout
	$"../MonsterBigAttack".play()
	await get_tree().create_timer(1).timeout
	#battle_timer3s.start()
	#await battle_timer3s.timeout
	if Global.monster_buff:
		$"../PlayerHealth".health_damage(25)
	else:
		$"../PlayerHealth".health_damage(15)


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
	$"../EndTurnButton".disabled = false
	$"../EndTurnButton".visible = true


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
