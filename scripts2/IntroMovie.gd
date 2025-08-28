extends Node2D

@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer


func _ready() -> void:
	$ClickContinue.visible = false
	$ContinueLabel.visible = false
	scene_transition_animation.play("fade_out")
	$AudioStreamPlayer.playing = true
	await get_tree().create_timer(0.5).timeout
	await get_tree().create_timer(48.5).timeout
	$FadeOutMusic.play("FadeOutMusic")
	await get_tree().create_timer(1).timeout
	$AudioStreamPlayer.playing = false
	$VideoStreamPlayer.visible = false
	$ContinueFadeIn.play("FadeIn")
	await get_tree().create_timer(1).timeout
	$ContinueBlinking.play("Blinking")


func _on_click_continue_pressed() -> void:
	$ContinueBlinking.stop()
	Global.intro_movie_seen = true
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes2/Main.tscn")
