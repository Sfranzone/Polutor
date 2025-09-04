extends Node2D

var MAX_GAUGE = 100


func _process(delta) -> void:
	if Global.env_soc_gauge < 25:
		$EnvSocProgressBar.texture_progress = $BlackGradient.texture
	elif Global.env_soc_gauge >= 75:
		$EnvSocProgressBar.texture_progress = $RedGradient.texture
	else:
		$EnvSocProgressBar.texture_progress = $GreenGradient.texture


func _ready() -> void:
	$EnvSocProgressBar.max_value = MAX_GAUGE
	set_gauge_bar()


func set_gauge_bar():
	$EnvSocProgressBar.value = Global.env_soc_gauge


func change_gauge_value(env_cost, soc_cost):
	Global.env_soc_gauge -= env_cost
	Global.env_soc_gauge += soc_cost
	set_gauge_bar()



#func _input(event):
	#if event.is_action_pressed("ui_accept"):
		#change_gauge_value(8, 5)
		#print(gauge_value)
