extends Panel

var current_money = 100
var current_social = 100
var current_env = 100

func _ready() -> void:
	$Money_bar/Money_bar.value = current_money
	$Money_bar/Number.text = str(current_money)
	
	$Social_bar/Social_bar.value = current_social
	$Social_bar/Number.text = str(current_social)
	
	$Env_bar/Env_bar.value = current_env
	$Env_bar/Number.text = str(current_env)


func change_money_values(number):
	current_money -= number
	print(current_money)
	$Money_bar/Money_bar.value = current_money
	$Money_bar/Number.text = str(current_money)

func change_social_values(number):
	current_social -= number
	print(current_social)
	$Social_bar/Social_bar.value = current_social
	$Social_bar/Number.text = str(current_social)

func change_env_values(number):
	current_env -= number
	print(current_env)
	$Env_bar/Env_bar.value = current_env
	$Env_bar/Number.text = str(current_env)
