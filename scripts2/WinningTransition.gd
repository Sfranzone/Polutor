extends Node2D

@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer


func _ready() -> void:
	CombatMusic.stop()
	TransitionMusic.playing = true
	$ClickToContinueLabel.visible = false
	scene_transition_animation.play("fade_out")
	await get_tree().create_timer(1.5).timeout
	$Text0/Text0FadeIn.play("Text0FadeIn")
	await get_tree().create_timer(1).timeout
	#$Text0/TextButton0.visible = true
	$Text1/Text1FadeIn.play("Text1FadeIn")
	await get_tree().create_timer(1).timeout
	$WhiteArrow/ArrowFadeIn.play("ArrowFadeIn")
	await get_tree().create_timer(0.5).timeout
	$WhiteArrow/ArrowBlinking.play("ArrowBlinking")
	$Text1/TextButton1.visible = true


func _on_click_to_continue_button_pressed() -> void:
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes2/Main2.tscn")


func _on_text_button_1_pressed() -> void:
	$Text1/TextButton1.visible = false
	$WhiteArrow/ArrowBlinking.stop()
	$WhiteArrow/WhiteArrowDown.visible = false
	$Text2/Text2FadeIn.play("Text2FadeIn")
	await get_tree().create_timer(1).timeout
	$WhiteArrow/ArrowFadeIn.play("ArrowFadeIn")
	await get_tree().create_timer(0.5).timeout
	$WhiteArrow/ArrowBlinking.play("ArrowBlinking")
	$Text2/TextButton2.visible = true


func _on_text_button_2_pressed() -> void:
	$Text2/TextButton2.visible = false
	$WhiteArrow/ArrowBlinking.stop()
	$WhiteArrow/WhiteArrowDown.visible = false
	$Text3/Text3FadeIn.play("Text3FadeIn")
	await get_tree().create_timer(1).timeout
	$WhiteArrow/ArrowFadeIn.play("ArrowFadeIn")
	await get_tree().create_timer(0.5).timeout
	$WhiteArrow/ArrowBlinking.play("ArrowBlinking")
	$Text3/TextButton3.visible = true


func _on_text_button_3_pressed() -> void:
	$Text3/TextButton3.visible = false
	$WhiteArrow/ArrowBlinking.stop()
	$WhiteArrow/WhiteArrowDown.visible = false
	$Text4/Text4FadeIn.play("Text4FadeIn")
	await get_tree().create_timer(1).timeout
	$WhiteArrow/ArrowFadeIn.play("ArrowFadeIn")
	await get_tree().create_timer(0.5).timeout
	$WhiteArrow/ArrowBlinking.play("ArrowBlinking")
	$Text4/TextButton4.visible = true


func _on_text_button_4_pressed() -> void:
	$Text4/TextButton4.visible = false
	$WhiteArrow/ArrowBlinking.stop()
	$WhiteArrow/WhiteArrowDown.visible = false
	$Text5/Text5FadeIn.play("Text5FadeIn")
	await get_tree().create_timer(1).timeout
	$ClickToContinueButton.visible = true
	$ContinueFadeIn.play("ContinueFadeIn")
	await get_tree().create_timer(0.5).timeout
	$ContinueBlinking.play("ContinueBlinking")
