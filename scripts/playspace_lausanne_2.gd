extends Node2D

# Variables
const card_size = Vector2(125,175)
var card_selected =[]
var deck_size = players_hand.card_list.size()

# Charger scripts
const card_base = preload("res://scenes/card_base.tscn")
const players_hand = preload("res://scripts/player_hand.gd")

@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer
@onready var centre_card_oval = Vector2(get_viewport().size) * Vector2(0.5,1.3)
@onready var hor_rad = Vector2(get_viewport().size).x*0.45
@onready var ver_rad = Vector2(get_viewport().size).y*0.4
var angle = 0 #deg_to_rad(90) - 0.6
var card_numb = 0
var number_cards_hand = -1
var card_spread = 0.25
var oval_angle_vector = Vector2()
var is_dead = false

enum{
	in_hand,
	in_play,
	in_mouse,
	focus_in_hand,
	move_drawn_card_to_hand,
	reorganise_hand,
	move_drawn_card_to_discard,
}

func _ready():
	randomize()
	$Enemies/Enemy.visible = true
	$Enemies/Enemy.position = get_viewport().size * 0.3 + Vector2(100,-100)
	$Enemies/Enemy.scale *= 0.5
	scene_transition_animation.play("fade_out")
	await get_tree().create_timer(0.5).timeout


@onready var deck_position = $Deck/Deck_draw.position
@onready var discard_position = $Discard/Discard_pile.position
func drawcard():
	angle = PI/2 + card_spread*(float(number_cards_hand)/2 - number_cards_hand)
	var new_card = card_base.instantiate()
	card_selected = randi() % deck_size
	new_card.card_name = players_hand.card_list[card_selected]
	new_card.position = deck_position - card_size/2
	new_card.discard_pile = discard_position - card_size/2
	new_card.scale *= card_size/new_card.size
	new_card.state = move_drawn_card_to_hand
	card_numb = 0
	$Cards.add_child(new_card)
	players_hand.card_list.erase(players_hand.card_list[card_selected])
	angle += 0.20
	deck_size -= 1
	number_cards_hand += 1
	organised_hand()
	return deck_size


func organised_hand():
	for card in $Cards.get_children(): #Réorganiser la main
		angle = PI/2 + card_spread*(float(number_cards_hand)/2 - card_numb)
		oval_angle_vector = Vector2(hor_rad * cos(angle), - ver_rad * sin(angle))
		
		card.targetpos = centre_card_oval + oval_angle_vector - card_size
		card.cardpos = card.targetpos
		#card.startrot = 0
		#card.targetrot = (90 - rad_to_deg(angle))/4
		card.card_numb = card_numb
		card_numb += 1
		if card.state == in_hand:
			card.setup = true
			card.state = reorganise_hand
		elif card.state == move_drawn_card_to_hand:
			card.startpos = card.targetpos - ((card.targetpos - card.position)/(1-card.t))
