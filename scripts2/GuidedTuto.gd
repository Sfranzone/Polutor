extends Node2D

@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer


var fire_screen_on = false
var darken_screen_on = false


func _process(delta: float) -> void:
	if Global.env_soc_gauge < 25:
		if darken_screen_on:
			pass
		else:
			$DarkenScreen/DarkenScreenAppear.play("DarkenScreenAppear")
			darken_screen_on = true
	elif Global.env_soc_gauge >= 75:
		if fire_screen_on:
			pass
		else:
			$FireScreen/FireScreenAppear.play("FireScreenAppear")
			fire_screen_on = true
	else:
		if fire_screen_on:
			$FireScreen/FireScreenDisappear.play("FireScreenDisappear")
			fire_screen_on = false
		elif darken_screen_on:
			$DarkenScreen/DarkenScreenDisappear.play("DarkenScreenDissappear")
			darken_screen_on = false
		else:
			pass


func _ready() -> void:
	# Things disabled at start
	$Welcome/NextWelcome.visible = false
	
	scene_transition_animation.play("fade_out")
	await get_tree().create_timer(0.5).timeout
	Global.stop_music()
	if CombatMusicTuto.playing == true:
		pass
	else:
		CombatMusicTuto.playing = true
	$EndTurnButton.disabled = true
	$EndTurnButton.visible = false
	await get_tree().create_timer(1).timeout
	$DarkenTutoStart/DarkenTutoStart.play("DarkenTutoStart")
	await get_tree().create_timer(2).timeout
	$Welcome/WelcomeFadeIn.play("WelcomeFadeIn")
	await get_tree().create_timer(3).timeout
	$Welcome/NextBlinking.play("NextBlinking")
	$Welcome/NextWelcomeButton.disabled = false
	


func _on_next_welcome_button_pressed() -> void:
	$Welcome/WelcomeFadeOut.play("WelcomeFadeOut")
	await get_tree().create_timer(1).timeout
	$Welcome.visible = false
	await get_tree().create_timer(1).timeout
	$MonsterAppear/MonsterFadeIn.play("MonsterFadeIn")


func _on_exit_tuto_pressed() -> void:
	$ExitTuto/ExitConfirmation.visible = true


func _on_no_pressed() -> void:
	$ExitTuto/ExitConfirmation.visible = false


func _on_yes_pressed() -> void:
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	Global.tutorial_done = true
	get_tree().change_scene_to_file("res://scenes2/Main.tscn")
