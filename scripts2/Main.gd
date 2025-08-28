extends Node2D


@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer


func _ready() -> void:
	scene_transition_animation.play("fade_out")
	await get_tree().create_timer(0.5).timeout
