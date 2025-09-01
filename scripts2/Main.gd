extends Node2D


@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer


func _ready() -> void:
	Global.env_soc_gauge = 50
	$EnvSocGauge.set_gauge_bar()
	scene_transition_animation.play("fade_out")
	await get_tree().create_timer(0.5).timeout
	CombatMusic.playing = true
	DefeatMusic.stop()
