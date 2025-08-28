extends Control

@onready var main_buttons: VBoxContainer = $Main_buttons
@onready var options_panel: Panel = $Options_panel
@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer

var intro_not = 1
var intro = 0

func _ready():
	main_buttons.visible = true
	options_panel.visible = false
	scene_transition_animation.play("fade_out")
	await get_tree().create_timer(0.5).timeout
	#scene_transition_animation.get_parent().get_node("ColorRect").color.a = 255
	#scene_transition_animation.play("fade_out")
	MapMusic

func _on_start_game_pressed():
	if Global.intro_movie_seen == false:
		scene_transition_animation.play("fade_in")
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes2/IntroMovie.tscn")
		intro_not = 0
	else:
		scene_transition_animation.play("fade_in")
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes2/Main.tscn")


func _on_options_pressed():
	main_buttons.visible = false
	options_panel.visible = true


func _on_exit_pressed():
	get_tree().quit()


func _on_back_options_pressed() -> void:
	main_buttons.visible = true
	options_panel.visible = false
