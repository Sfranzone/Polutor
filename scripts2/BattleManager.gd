extends Node

var battle_timer1s
var battle_timer2s
var battle_timer3s
var battle_timer4s
var monster_buff_25 = false
var monster_buff_75 = false


func _process(delta: float) -> void:
	if Global.env_soc_gauge < 25:
		monster_buff_25 = true
	elif Global.env_soc_gauge >= 75:
		monster_buff_75 = true
	else:
		monster_buff_25 = false
		monster_buff_75 = false


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
	
	if monster_buff_25 or monster_buff_75:
		if randf() < 0.1:
			# Monster basic attack
			monster_basic_attack()
			battle_timer2s.start()
			await battle_timer2s.timeout
		else:
			# Monster big atack
			monster_big_attack()
			battle_timer4s.start()
			await battle_timer4s.timeout
	else:
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
	$"../Enemy/BasicAttack/BasicAttackMove".play("AttackMove")
	await get_tree().create_timer(0.5).timeout
	$"../MonsterBaseAttack".play()
	await get_tree().create_timer(0.5).timeout
	$"../PlayerHealth".health_damage(5)


func monster_big_attack():
	$"../Enemy/BigAttack/BigAttackMove".play("BigAttack")
	await get_tree().create_timer(2).timeout
	$"../MonsterBigAttack".play()
	await get_tree().create_timer(1).timeout
	$"../PlayerHealth".health_damage(15)


func end_monster_turn():
	# End monster turn
	if $"../PlayerHand".player_hand.size() > 6:
		pass
	else:
		$"../Deck".draw_card()
	$"../Mana".reset_mana()
	await get_tree().create_timer(0.5).timeout
	if $"../PlayerHand".player_hand.size() > 6:
		pass
	else:
		$"../Deck".draw_card()
	await get_tree().create_timer(1).timeout
	if Global.env_soc_gauge < 25 and $"../PlayerHand".player_hand.size() > 0:
		$"../PlayerHand".player_hand[int(randi_range(0, $"../PlayerHand".player_hand.size()-1))].visible = false
	$"../EndTurnButton".disabled = false
	$"../EndTurnButton".visible = true
