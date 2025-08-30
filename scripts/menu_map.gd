extends Node2D

@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer


func _on_yes_pressed() -> void:
	get_tree().quit()


func _on_exit_pressed() -> void:
	$Confirmation_quit.visible = true


func _on_no_pressed() -> void:
	$Confirmation_quit.visible = false


func _on_main_menu_pressed() -> void:
	$Confirmation_quit_to_menu.visible = true


func _on_no_menu_pressed() -> void:
	$Confirmation_quit_to_menu.visible = false


func _on_yes_menu_pressed() -> void:
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_back_pressed() -> void:
	$Options_panel.visible = false


func _on_options_pressed() -> void:
	$Options_panel.visible = true


func _on_help_pressed() -> void:
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
