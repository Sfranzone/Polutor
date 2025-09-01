extends Node2D


@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer


func _ready() -> void:
	Global.stop_music()
	Global.env_soc_gauge = Global.env_soc_gauge_default
	$EnvSocGauge.set_gauge_bar()
	scene_transition_animation.play("fade_out")
	await get_tree().create_timer(0.5).timeout
	CombatMusic.playing = true
