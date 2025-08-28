extends MarginContainer

@onready var hit_flash = $VBoxContainer/Image_Container/Image/Flash_animation
@onready var death_flash = $VBoxContainer/Image_Container/Image/Death_flash
@onready var falling = $VBoxContainer/Image_Container/Image/Falling

var current_health = 100
var max_health = 100
var death_timer = 1


func _ready():
	$VBoxContainer/Image_Container/Image.scale *= Vector2(0.45,0.45)#$VBoxContainer/Image_Container.custom_minimum_size/$VBoxContainer/Image_Container/Image.texture.get_size()
	$VBoxContainer/Bar/Count/TextureProgress.value = current_health
	$VBoxContainer/Bar/Count/Background/Number.text = str(current_health)


func change_health(Number):
	current_health -= Number
	$VBoxContainer/Bar/Count/TextureProgress.value = 100*current_health/max_health
	$VBoxContainer/Bar/Count/Background/Number.text = str(current_health)
	hit_flash.play("flash")
	$Hit_sound.play()
	if current_health <= 0:
		$VBoxContainer/Bar/Count/Background/Number.text = str("0")
		await get_tree().create_timer(0.5).timeout
		death_flash.play("death")
		$Monster_death.play()
		await get_tree().create_timer(1).timeout
		falling.play("falling")
		await get_tree().create_timer(2).timeout
		CombatMusic.playing = false
		get_tree().change_scene_to_file("res://scenes/victory_2_lausanne.tscn")
		
