extends Node2D

const MAX_MANA = 10

var mana = MAX_MANA


func _ready() -> void:
	update_mana_ui()
	$ManaBar.max_value = MAX_MANA


func update_mana_ui() -> void:
	set_mana_bar()
	set_mana_label()


func set_mana_label() -> void:
	$ManaLabel.text = "%s/%d" % [mana, MAX_MANA]


func set_mana_bar() -> void:
	$ManaBar.value = mana


func mana_spent(mana_spent):
	mana -= mana_spent
	#if mana <= 0:
		#mana = MAX_MANA
	update_mana_ui()


func reset_mana():
	mana = MAX_MANA
	update_mana_ui()


#func _input(event):
	#if event.is_action_pressed("ui_accept"):
		#mana_spent(2)
		#print(mana)
