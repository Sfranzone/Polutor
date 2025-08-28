extends Node2D


@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer

func _ready() -> void:
	scene_transition_animation.play("fade_out")
	await get_tree().create_timer(0.5).timeout

func _on_exit_pressed() -> void:
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/switzerland.tscn")


func _on_next_1_pressed() -> void:
	$Cards_explanation.visible = false
	$Combat_explanation.visible = true


func _on_next_2_pressed() -> void:
	$Combat_explanation.visible = false
	$Rules_explanation.visible = true


func _on_previous_1_pressed() -> void:
	$Cards_explanation.visible = true
	$Combat_explanation.visible = false


func _on_next_4_pressed() -> void:
	$Rules_explanation.visible = false
	$Rules_explanation2.visible = true


func _on_previous_2_pressed() -> void:
	$Rules_explanation.visible = false
	$Combat_explanation.visible = true


func _on_next_5_pressed() -> void:
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/switzerland.tscn")


func _on_previous_3_pressed() -> void:
	$Rules_explanation2.visible = false
	$Rules_explanation.visible = true
