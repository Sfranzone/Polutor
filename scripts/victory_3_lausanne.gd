extends Node2D

@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer

func _ready() -> void:
	VictoryMusic.playing = true
	scene_transition_animation.play("fade_out")
	await get_tree().create_timer(0.5).timeout

func _on_continue_pressed() -> void:
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	VictoryMusic.playing = false
	get_tree().change_scene_to_file("res://scenes/switzerland.tscn")
