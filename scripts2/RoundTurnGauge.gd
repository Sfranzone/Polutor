extends Node2D


@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer


var TURN_MAX = 10


var turn = 0


func _ready() -> void:
	$RoundTurnGauge.max_value = TURN_MAX
	set_turn_bar()


func set_turn_bar() -> void:
	$RoundTurnGauge.value = turn


func set_turn_up(turn_up):
	turn += turn_up
	if turn <= 0:
		turn = 0
		set_turn_bar()
		player_dead()
	else:
		set_turn_bar()


func player_dead():
	await get_tree().create_timer(1).timeout
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes2/LosingScreen.tscn")
