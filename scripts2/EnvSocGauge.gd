extends Node2D

var MAX_GAUGE = 50

var gauge_value = MAX_GAUGE / 2


func _ready() -> void:
	$EnvSocProgressBar.max_value = MAX_GAUGE
	set_gauge_bar()


func set_gauge_bar():
	$EnvSocProgressBar.value = gauge_value


func change_gauge_value(env_cost, soc_cost):
	gauge_value += env_cost - soc_cost
	set_gauge_bar()



#func _input(event):
	#if event.is_action_pressed("ui_accept"):
		#change_gauge_value(8, 5)
		#print(gauge_value)
