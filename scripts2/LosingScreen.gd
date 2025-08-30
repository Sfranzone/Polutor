extends Node2D


@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer


func _ready() -> void:
	scene_transition_animation.play("fade_out")
	await get_tree().create_timer(0.5).timeout
	$"3dots4".play("3dots")
	CombatMusic.stop()

func _on_restart_pressed() -> void:
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes2/Main.tscn")


func _on_to_main_menu_pressed() -> void:
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
