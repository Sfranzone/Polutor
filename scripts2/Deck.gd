extends Node2D

const CARD_SCENE_PATH = "res://scenes2/Card.tscn"
const CARD_DRAW_SPEED = 1
const STARTING_HAND_SIZE = Global.starting_hand_size


var player_deck = [
	"Eolapino","Eolapino", 
	"Nuclearo", "Nuclearo", 
	"Barrachat", "Barrachat", 
	"Thermhibou", "Thermhibou", 
	"Panolero", "Panolero", 
	"Amigo Tri", 
	"Nuclearo Destructo", 
	"Taxito Gratuito", 
	"Climato Froido"
	]
var card_database_reference
var draw_card_this_turn = false


func _ready() -> void:
	player_deck.shuffle()
	$RichTextLabel.text = str(player_deck.size())
	card_database_reference = preload("res://scripts2/CardDatabase.gd")
	for i in range(STARTING_HAND_SIZE):
		draw_card()
		draw_card_this_turn = false
	draw_card_this_turn = true


func draw_card():
	#if draw_card_this_turn:
		#return
	
	draw_card_this_turn = true
	
	
	# If player drew the last card in the deck, disable the deck
	if player_deck.size() == 0:
		$Area2D/CollisionShape2D.disabled = true
		$Sprite2D.visible = false
		$RichTextLabel.visible = false
		return
	
	var card_drawn_name = player_deck[0]
	player_deck.erase(card_drawn_name)
	$RichTextLabel.text = str(player_deck.size())
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	var card_image_path = str("res://assets/cards/" + card_drawn_name + ".png")
	new_card.get_node("CardImage").texture = load(card_image_path)
	new_card.get_node("ManaCost").text = str(card_database_reference.CARDS[card_drawn_name][0])
	new_card.get_node("SocialCost").text = str(card_database_reference.CARDS[card_drawn_name][1])
	new_card.get_node("EnvCost").text = str(card_database_reference.CARDS[card_drawn_name][2])
	new_card.get_node("Damage").text = str(card_database_reference.CARDS[card_drawn_name][3])
	new_card.get_node("Description").text = card_database_reference.CARDS[card_drawn_name][4]
	new_card.get_node("NameCard").text = card_drawn_name
	$"../CardManager".add_child(new_card)
	new_card.name = "Card"
	$"../PlayerHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)
	new_card.get_node("AnimationPlayer").play("card_flip")
