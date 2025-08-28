extends Node2D


signal hovered
signal hovered_off

var starting_position_hand


func _ready() -> void:
	# All cards must be child of card manager or this will error
	get_parent().connect_card_signal(self)


func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self)


func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self)
