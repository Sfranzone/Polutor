extends Node2D

@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer

var TURN_FULL = 10



var turn = TURN_FULL


func _ready() -> void:
	$TurnProgressBar.max_value = TURN_FULL
	update_turn_ui()


func update_turn_ui():
	set_turn_bar()
	set_turn_label()


func set_turn_bar() -> void:
	$TurnProgressBar.value = turn


func set_turn_label():
	$TurnNumber.text = str(turn)



func set_turn_down(turn_down):
	turn -= turn_down
	if turn <= 0:
		turn = 0
		update_turn_ui()
		player_dead()
	else:
		update_turn_ui()






func player_dead():
	#$"../BattleManager".battle_timer1s.start()
	#await $"../BattleManager".battle_timer1s.timeout
	await get_tree().create_timer(1).timeout
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes2/LosingScreen.tscn")
