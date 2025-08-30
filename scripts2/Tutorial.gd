extends Control


func _ready() -> void:
	if Global.tutorial_done == false:
		$Control/Tuto2/Text2.visible = false
		$Control/Tuto3/Text3.visible = false
		$Control/Tuto4/Text4.visible = false
		$Control/Tuto5/Text5.visible = false
		$Control/Tuto6/Text6.visible = false
		$Control/Tuto7/Text7.visible = false
		$Control/Tuto8/Text8.visible = false
		$Control/Tuto1/ClickToContinue.visible = false
		await get_tree().create_timer(1).timeout
		$Control/TutoStart.play("TutoStart")
		await get_tree().create_timer(4).timeout
		$Control/Tuto1/Blinking.play("ContinueBlink")
		$Control/Tuto1/ContinueButton1.visible = true
	else:
		$".".visible = false


func _on_continue_button_1_pressed() -> void:
	$Control/Tuto1/ContinueButton1.visible = false
	$Control/Tuto1/Blinking.stop()
	$Control/Tuto1/Next1.play("Next1")
	await get_tree().create_timer(2).timeout
	$Control/Tuto2/PointingArrow2.play("PointingArrow2")
	await get_tree().create_timer(2).timeout
	$Control/Tuto1/Blinking.play("ContinueBlink")
	$Control/Tuto2/ContinueButton2.visible = true


func _on_continue_button_2_pressed() -> void:
	$Control/Tuto2/ContinueButton2.visible = false
	$Control/Tuto1/Blinking.stop()
	$Control/Tuto2/Next2.play("Next2")
	await get_tree().create_timer(5).timeout
	$Control/Tuto1/Blinking.play("ContinueBlink")
	$Control/Tuto3/ContinueButton3.visible = true


func _on_continue_button_3_pressed() -> void:
	$Control/Tuto3/ContinueButton3.visible = false
	$Control/Tuto1/Blinking.stop()
	$Control/Tuto3/Next3.play("Next3")
	await get_tree().create_timer(5).timeout
	$Control/Tuto1/Blinking.play("ContinueBlink")
	$Control/Tuto4/ContinueButton4.visible = true



func _on_continue_button_4_pressed() -> void:
	$Control/Tuto4/ContinueButton4.visible = false
	$Control/Tuto1/Blinking.stop()
	$Control/Tuto2/PointingArrow2.stop()
	$Control/Tuto2/RedArrow2.visible = false
	$Control/Tuto4/Next4.play("Next4")
	await get_tree().create_timer(3).timeout
	$Control/Tuto5/PointingArrow3.play("PointingArrow3")
	await get_tree().create_timer(2).timeout
	$Control/Tuto1/Blinking.play("ContinueBlink")
	$Control/Tuto5/ContinueButton5.visible = true



func _on_continue_button_5_pressed() -> void:
	$Control/Tuto5/ContinueButton5.visible = false
	$Control/Tuto1/Blinking.stop()
	$Control/Tuto5/PointingArrow3.stop()
	$Control/Tuto5/RedArrow3.visible = false
	$Control/Tuto5/Next5.play("Next5")
	await get_tree().create_timer(5).timeout
	$Control/Tuto1/Blinking.play("ContinueBlink")
	$Control/Tuto6/ContinueButton6.visible = true



func _on_continue_button_6_pressed() -> void:
	$Control/Tuto6/ContinueButton6.visible = false
	$Control/Tuto1/Blinking.stop()
	$Control/Tuto6/Next6.play("Next6")
	await get_tree().create_timer(3).timeout
	$Control/Tuto7/PointingArrow4.play("PointingArrow4")
	await get_tree().create_timer(2).timeout
	$Control/Tuto1/Blinking.play("ContinueBlink")
	$Control/Tuto7/ContinueButton7.visible = true



func _on_continue_button_7_pressed() -> void:
	$Control/Tuto7/ContinueButton7.visible = false
	$Control/Tuto1/Blinking.stop()
	$Control/Tuto7/PointingArrow4.stop()
	$Control/Tuto7/Next7.play("Next7")
	await get_tree().create_timer(5).timeout
	$Control/Tuto1/Blinking.play("ContinueBlink")
	$Control/Tuto8/ContinueButton8.visible = true



func _on_continue_button_8_pressed() -> void:
	$Control/Tuto8/ContinueButton8.visible = false
	Global.tutorial_done = true
	$".".visible = false


func _on_yes_pressed() -> void:
	$".".visible = false
	Global.tutorial_done = true


func _on_no_pressed() -> void:
	$Control/SkipTuto2/ConfirmSkipTutoBG.visible = false


func _on_skip_tuto_pressed() -> void:
	$Control/SkipTuto2/ConfirmSkipTutoBG.visible = true
