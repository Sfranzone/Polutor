extends Node2D

@onready var not_available = $Suisse_map/Not_available_now
@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer


func _ready() -> void:
	scene_transition_animation.play("fade_out")
	await get_tree().create_timer(0.5).timeout


func _on_button_lausanne_pressed() -> void:
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/intro_laus_1.tscn")


func _on_not_available_now_close_requested() -> void:
	not_available.hide()


func _on_button_neuchatel_pressed() -> void:
	not_available.visible = true


func _on_button_berne_pressed() -> void:
	not_available.visible = true


func _on_button_sion_pressed() -> void:
	not_available.visible = true


func _on_button_lucerne_pressed() -> void:
	not_available.visible = true


func _on_button_locarno_pressed() -> void:
	not_available.visible = true


func _on_button_bale_pressed() -> void:
	not_available.visible = true


func _on_button_zurich_pressed() -> void:
	not_available.visible = true
