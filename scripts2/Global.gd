extends Node


const starting_hand_size = 6


var tutorial_done = false
var intro_movie_seen = true
var monster_turn = false
var stop_drag_card = true

# Monster management
var monster_buff = false
var gazo_boosted = false


# EnvSoc gauge management
var env_soc_gauge_default = 50
var env_soc_gauge = 50


func stop_music():
	CombatMusic.stop()
	CombatMusic2.stop()
	CombatMusicTuto.stop()
	TransitionMusic.stop()
	MapMusic.stop()
	DefeatMusic.stop()
	VictoryMusic.stop()
