extends Node2D

@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer

const MAX_HEALTH = 50

var health = MAX_HEALTH


func _ready() -> void:
	$PlayerHealthBar.max_value = MAX_HEALTH
	update_health_ui()


func update_health_ui() -> void:
	set_health_bar()
	set_health_label()


func set_health_label() -> void:
	$PlayerHealthLabel.text = "%s/%d" % [health, MAX_HEALTH]


func set_health_bar() -> void:
	$PlayerHealthBar.value = health


func health_damage(health_damage):
	health -= health_damage
	if health <= 0:
		health = 0
		update_health_ui()
		player_dead()
	else:
		update_health_ui()


func reset_health():
	health = MAX_HEALTH
	update_health_ui()


func player_dead():
	#$"../BattleManager".battle_timer1s.start()
	#await $"../BattleManager".battle_timer1s.timeout
	await get_tree().create_timer(1).timeout
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes2/LosingScreen.tscn")


#func _input(event):
	#if event.is_action_pressed("ui_accept"):
		#health_damage(10)
		#print(health)
