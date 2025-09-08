extends Node2D

@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer

const MAX_HEALTH = 150
const MAX_HEALTH_MONSTER_BUFF = 200

var health = MAX_HEALTH


func _process(delta: float) -> void:
	if Global.env_soc_gauge >= 75:
		$FlameAura.visible = true
	else:
		$FlameAura.visible = false


func _ready() -> void:
	update_health_ui()
	if Global.env_soc_gauge > 75:
		$HealthBar.max_value = MAX_HEALTH_MONSTER_BUFF
	elif Global.env_soc_gauge < 25:
		Global.gazo_boosted = true
	else:
		$HealthBar.max_value = MAX_HEALTH


func update_health_ui() -> void:
	set_health_bar()
	set_health_label()


func set_health_label() -> void:
	$HealthLabel.text = "Gazo: %s" % health


func set_health_bar() -> void:
	$HealthBar.value = health


func damage(dmg) -> void:
	$Hit_sound.play()
	health -= dmg
	if health <= 0:
		health = 0
		enemy_death()
	update_health_ui()


func enemy_death() -> void:
	$EnemyDeath/EnemyDeath.play("EnemyDeath")
	await get_tree().create_timer(0.5).timeout
	$Monster_death.play()
	await get_tree().create_timer(4).timeout
	get_tree().change_scene_to_file("res://scenes2/WinningScreen.tscn")
