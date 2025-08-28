extends Node2D

@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer

func _ready() -> void:
	scene_transition_animation.play("fade_out")
	$AudioStreamPlayer.playing = true
	await get_tree().create_timer(0.5).timeout
	await get_tree().create_timer(48.5).timeout
	$Animation_audio.play("fade_out_music")
	await get_tree().create_timer(1).timeout
	$AudioStreamPlayer.playing = false
	$VideoStreamPlayer.visible = false
	$Intro_panel.visible = true
	$Animation_text.play("fade_in")


func _on_button_pressed() -> void:
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes2/Main.tscn")
