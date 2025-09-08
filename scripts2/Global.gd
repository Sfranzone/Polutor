extends Node


const starting_hand_size = 6


var tutorial_done = true
var intro_movie_seen = true

# Monster management
var monster_buff = false
var gazo_boosted = false


# EnvSoc gauge management
var env_soc_gauge_default = 50
var env_soc_gauge = 50


func stop_music():
	CombatMusic.stop()
	CombatMusic2.stop()
	TransitionMusic.stop()
	MapMusic.stop()
	DefeatMusic.stop()
	VictoryMusic.stop()
