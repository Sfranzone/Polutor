extends Node2D


func _on_swiss_button_pressed() -> void:
	get_tree().change_scene_to_file("res://switzerland.tscn")


func _on_not_available_now_close_requested() -> void:
	$"Not_available_now".hide()


func _on_italy_button_pressed() -> void:
	$"Not_available_now".visible = true


func _on_germany_button_pressed() -> void:
	$"Not_available_now".visible = true


func _on_france_button_pressed() -> void:
	$"Not_available_now".visible = true


func _on_spain_button_pressed() -> void:
	$"Not_available_now".visible = true


func _on_norway_button_pressed() -> void:
	$"Not_available_now".visible = true


func _on_portugal_button_pressed() -> void:
	$"Not_available_now".visible = true


func _on_UK_button_pressed() -> void:
	$"Not_available_now".visible = true
