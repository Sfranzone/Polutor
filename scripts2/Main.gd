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
	Global.stop_music()
	Global.env_soc_gauge = Global.env_soc_gauge_default
	$EnvSocGauge.set_gauge_bar()
	scene_transition_animation.play("fade_out")
	await get_tree().create_timer(0.5).timeout
	CombatMusic.playing = true
