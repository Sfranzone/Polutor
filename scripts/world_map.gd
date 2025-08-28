extends Node2D

@onready var scene_transition_animation = $"Scene_transition_animation/AnimationPlayer"

func _ready() -> void:
	#scene_transition_animation.get_parent().get_node("ColorRect").color.a = 255
	#scene_transition_animation.play("fade_out")
	pass

func _on_not_available_now_close_requested() -> void:
	$"Continents/Not_available_now".hide()


func _on_oceania_button_pressed() -> void:
	$"Continents/Not_available_now".popup()


func _on_south_america_button_pressed() -> void:
	$"Continents/Not_available_now".popup()


func _on_north_america_button_pressed() -> void:
	$"Continents/Not_available_now".popup()


func _on_africa_button_pressed() -> void:
	$"Continents/Not_available_now".popup()


func _on_asia_button_pressed() -> void:
	$"Continents/Not_available_now".popup()


func _on_europe_button_pressed() -> void:
	get_tree().change_scene_to_file("res://europe.tscn")
