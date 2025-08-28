extends MarginContainer

@onready var card_database = preload("res://scripts/cards_database.gd").new()
var card_name = "Thermhibou"
@onready var card_info = card_database.DATA[card_database.get(card_name)]
@onready var card_img = str("res://assets/cards/",card_name,".png")

#var playspace_node

var startpos = 0
var targetpos = 0
#var startrot = 0
#var targetrot = 0
var t = 0
var DRAWTIME = 1
var ORGANISETIME = 0.5
@onready var orig_scale = scale
enum{
	in_hand,
	in_play,
	in_mouse,
	focus_in_hand,
	move_drawn_card_to_hand,
	reorganise_hand,
	move_drawn_card_to_discard,
}
var state = in_hand

func _ready():
	#var p = get_node_or_null('../../Enemies')
	#if p:
		#playspace_node = p
	#else:
		#print("PlaySpace node not found")
	print(card_info)
	#var card_size = size
	#$Border.scale *= card_size/$Border.texture.get_size()
	$Card.texture = load(card_img)
	#$Card.scale = Vector2(0.44,0.44)
	var card_type = str(card_info[0])
	var money_cost = str(card_info[1])
	var social_cost = str(card_info[2])
	var env_cost = str(card_info[3])
	var card_damage = str(card_info[4])
	var card_name = str(card_info[5])
	var card_description = str(card_info[6])
	$Bars/top_bar/name/CenterContainer/name.text = card_name
	$Bars/top_bar/money_cost/CenterContainer/money_cost.text = money_cost
	$Bars/top_bar/social_cost/CenterContainer/social_cost.text = social_cost
	$Bars/top_bar/env_cost/CenterContainer/env_cost.text = env_cost
	$Bars/bottom_bar/card_description/CenterContainer/card_description.text = card_description
	$Bars/mid_bar/damage/CenterContainer/damage.text = card_damage
	
var setup = true
var startscale = Vector2()
var cardpos = Vector2()
var zoom_in_size = 2
var ZOOMINTIME = 0.2
var reorganise_neighbours = true
var number_cards_hand = 0
var card_numb = 0
var neighbour_card
var move_neighbour_card_check = false
#var Zooming_In = true

var current_money = 100
var current_social = 100
var current_env = 100

var oldstate = INF
var CARD_SELECT = true
var INMOUSETIME = 0.1
var targetscale = Vector2()
var discard_pile = Vector2()
var moving_to_discard = false
func _input(event: InputEvent) -> void:
	match state:
		focus_in_hand, in_mouse, in_play:
			if event.is_action_pressed("leftclick"): #Prendre la carte
				if CARD_SELECT:
					
					state = in_mouse
					setup = true
					oldstate = state
					CARD_SELECT = false
			if event.is_action_released("leftclick"):
				if CARD_SELECT == false:
					var enemies = $'../../Enemies'
					var costs = $'../../MSE_bars'
					for i in range(enemies.get_child_count()):
						var enemypos = enemies.get_child(i).position
						var enemy_size = enemies.get_child(i).size
						var mousepos = get_global_mouse_position()
						if mousepos.x < enemypos.x + enemy_size.x && mousepos.x > enemypos.x \
							&& mousepos.y < enemypos.y + enemy_size.y && mousepos.y > enemypos.y:
							var attack_num = int($Bars/mid_bar/damage/CenterContainer/damage.text)
							enemies.get_child(i).change_health(attack_num)
							var money_cost = int($Bars/top_bar/money_cost/CenterContainer/money_cost.text)
							var social_cost = int($Bars/top_bar/social_cost/CenterContainer/social_cost.text)
							var env_cost = int($Bars/top_bar/env_cost/CenterContainer/env_cost.text)
							
							costs.change_money_values(money_cost)
							costs.change_social_values(social_cost)
							costs.change_env_values(env_cost)
							
							setup = true
							moving_to_discard = true
							state = move_drawn_card_to_discard
							#targetpos = cardpos
							#state = reorganise_hand
							CARD_SELECT = true
							break
					if CARD_SELECT == false:
						setup = true
						targetpos = cardpos
						state = reorganise_hand
						CARD_SELECT = true


func _physics_process(delta):
	match state:
		in_hand:
			pass
		in_play:
			pass
		in_mouse:
			if setup:
				Setup()
			if t <= 1:
				position = startpos.lerp(get_global_mouse_position() - $'../../'.card_size, t)
				#rotation = startrot * (1-t) + targetrot*t
				scale = startscale * (1-t) + orig_scale*t
				t += delta/float(INMOUSETIME)
			else:
				position = get_global_mouse_position() - $'../../'.card_size
				#rotation = 0
				
		focus_in_hand:
			if setup:
				Setup()
			if t <= 1:
				position = startpos.lerp(targetpos, t)
				#rotation = startrot * (1-t) + 0*t
				scale = startscale * (1-t) + orig_scale*zoom_in_size*t
				t += delta/float(ZOOMINTIME)
				if reorganise_neighbours:
					reorganise_neighbours = false
					number_cards_hand = $'../../'.number_cards_hand - 1
					if card_numb - 1 >= 0:
						move_neighbour_card(card_numb - 1,true,1) #true is left
					if card_numb - 2 >= 0:
						move_neighbour_card(card_numb - 2,true,0.25)
					if card_numb + 1 <= number_cards_hand:
						move_neighbour_card(card_numb + 1,false,1)
					if card_numb + 2 <= number_cards_hand:
						move_neighbour_card(card_numb + 2,false,0.25)
			else:
				position = targetpos
				#rotation = targetrot
				scale = orig_scale*zoom_in_size
		move_drawn_card_to_hand: #Animation du deck à la main
			if setup:
				Setup()
			if t <= 1:
				position = startpos.lerp(targetpos, t)
				#rotation = startrot * (1-t) + targetrot*t
				scale.x = orig_scale.x * abs(2*t - 1)
				if $Card_back.visible:
					if t >= 0.5:
						$Card_back.visible = false
				t += delta/float(DRAWTIME)
			else:
				position = targetpos
				#rotation = targetrot
				state = in_hand
				#t = 0
		reorganise_hand:
			#if Zooming_In:
			if setup:
				Setup()
			if t <= 1:
				if move_neighbour_card_check:
					move_neighbour_card_check = false
				position = startpos.lerp(targetpos, t)
				#rotation = startrot * (1-t) + targetrot*t
				scale = startscale * (1-t) + orig_scale*t
				t += delta/float(ORGANISETIME)
				if reorganise_neighbours == false:
					reorganise_neighbours = true
					if card_numb - 1 >= 0:
						reset_card(card_numb - 1) #true is left
					if card_numb - 2 >= 0:
						reset_card(card_numb - 2)
					if card_numb + 1 <= number_cards_hand:
						reset_card(card_numb + 1)
					if card_numb + 2 <= number_cards_hand:
						reset_card(card_numb + 2)
			else:
				position = targetpos
				#rotation = targetrot
				scale = orig_scale
				state = in_hand
				#t = 0
				#Zooming_In = false
		move_drawn_card_to_discard:
			if moving_to_discard:
				if setup:
					Setup()
					targetpos = discard_pile
				if t <= 1:
					position = startpos.lerp(targetpos, t)
					scale = startscale * (1-t) + orig_scale*t
					t += delta/float(0.5)
				else:
					position = targetpos
					scale = orig_scale
					moving_to_discard = false


func move_neighbour_card(card_numb,left,spread_factor):
	neighbour_card = $'../'.get_child(card_numb)
	if left:
		neighbour_card.targetpos = neighbour_card.cardpos - spread_factor*Vector2(65,0)
	else:
		neighbour_card.targetpos = neighbour_card.cardpos + spread_factor*Vector2(65,0)
	neighbour_card.setup = true
	neighbour_card.state = reorganise_hand
	neighbour_card.move_neighbour_card_check = true
	
func reset_card(card_numb):
	#neighbour_card = $'../'.get_child(card_numb)
	#if neighbour_card.move_neighbour_card_check:
		#neighbour_card.move_neighbour_card_check = false
	if neighbour_card.move_neighbour_card_check == false:
		neighbour_card = $'../'.get_child(card_numb)
		if neighbour_card.state != focus_in_hand:
			neighbour_card.state = reorganise_hand
			neighbour_card.targetpos = neighbour_card.cardpos
			neighbour_card.setup = true
	

func Setup():
	startpos = position
	#startrot = rotation
	startscale = scale
	t = 0
	setup = false

func _on_focus_mouse_entered():
	match state:
		in_hand, reorganise_hand:
			setup = true
			targetpos = cardpos
			targetpos.y = get_viewport_rect().size.y - ($'../../'.card_size.y*zoom_in_size)
			#Zooming_In = true
			state = focus_in_hand


func _on_focus_mouse_exited():
	match state:
		focus_in_hand:
			setup = true
			targetpos = cardpos
			state = reorganise_hand
			
func change_money_values(number):
	current_money -= number
	print(current_money)
	#$MSE_bars/Money_bar/Money_bar.value = current_money
	#$MSE_bars/Money_bar/Number.text = str(current_money)

func change_social_values(number):
	current_social -= number
	print(current_social)
	#$MSE_bars/Social_bar/Social_bar.value = current_social
	#$MSE_bars/Social_bar/Number.text = str(current_social)

func change_env_values(number):
	current_env -= number
	print(current_env)
	#$MSE_bars/Env_bar/Env_bar.value = current_env
	#$MSE_bars/Env_bar/Number.text = str(current_env)
