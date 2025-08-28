extends Node

@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer

func _ready() -> void:
	scene_transition_animation.play("fade_out")
	await get_tree().create_timer(1.5).timeout
	$Panel.visible = true
	$Fade_in_text.play("fade_in_text")
	await get_tree().create_timer(11).timeout
	$Button.visible = true
	$Flashing.play("flashing")
	


func _on_button_pressed() -> void:
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/playspace.tscn")
