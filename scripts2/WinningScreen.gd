extends Node2D


@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer


func _ready() -> void:
	scene_transition_animation.play("fade_out")
	await get_tree().create_timer(0.5).timeout
	$ExclamationPoint4.play("ExclamationPoint4")
	$HappyFox/FoxJump.play("FoxJump")
	await get_tree().create_timer(0.5).timeout
	$HappyCat/CatJump.play("CatJump")
	await get_tree().create_timer(0.5).timeout
	$HappyRabbit/RabbitJump.play("RabbitJump")
	await get_tree().create_timer(0.5).timeout
	$HappyFrog/FrogJump.play("FrogJump")
	CombatMusic.stop()
	VictoryMusic.play()


func _on_to_main_menu_pressed() -> void:
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
