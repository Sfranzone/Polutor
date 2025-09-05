extends Node2D

@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer

var TOUR_FULL = 10



var tour = TOUR_FULL


func _ready() -> void:
	$TourProgressBar.max_value = TOUR_FULL
	update_turn_ui()


func update_turn_ui():
	set_turn_bar()
	set_turn_label()


func set_turn_bar() -> void:
	$TurnProgressBar.value = tour


func set_turn_label():
	$TurnNumber.text = str(tour)



func set_turn_down(tour_down):
	tour -= tour_down
	if tour <= 0:
		tour = 0
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
