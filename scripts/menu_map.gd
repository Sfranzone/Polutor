extends Node2D

@onready var scene_transition_animation = $Scene_transition_animation/AnimationPlayer


func _ready() -> void:
	var card_database_reference = preload("res://scripts2/CardDatabase.gd")
	$Cards_explanation/Panel/Page1/Eolapino/Description.text = "Description :\n" + card_database_reference.CARDS["Eolapino"][4]
	$Cards_explanation/Panel/Page1/Eolapino/Dmg.text = "Dégâts :\n" + str(card_database_reference.CARDS["Eolapino"][3])
	$Cards_explanation/Panel/Page1/Eolapino/Mana.text = "Mana :\n" + str(card_database_reference.CARDS["Eolapino"][0])
	$Cards_explanation/Panel/Page1/Eolapino/SocCost.text = "Social :\n" + str(card_database_reference.CARDS["Eolapino"][1])
	$Cards_explanation/Panel/Page1/Eolapino/EnvCost.text = "Env. :\n" + str(card_database_reference.CARDS["Eolapino"][2])
	$Cards_explanation/Panel/Page1/Barrachat/Description.text = "Description :\n" + card_database_reference.CARDS["Barrachat"][4]
	$Cards_explanation/Panel/Page1/Barrachat/Dmg.text = "Dégâts :\n" + str(card_database_reference.CARDS["Barrachat"][3])
	$Cards_explanation/Panel/Page1/Barrachat/Mana.text = "Mana :\n" + str(card_database_reference.CARDS["Barrachat"][0])
	$Cards_explanation/Panel/Page1/Barrachat/SocCost.text = "Social :\n" + str(card_database_reference.CARDS["Barrachat"][1])
	$Cards_explanation/Panel/Page1/Barrachat/EnvCost.text = "Env. :\n" + str(card_database_reference.CARDS["Barrachat"][2])
	$Cards_explanation/Panel/Page1/Thermhibou/Description.text = "Description :\n" + card_database_reference.CARDS["Thermhibou"][4]
	$Cards_explanation/Panel/Page1/Thermhibou/Dmg.text = "Dégâts :\n" + str(card_database_reference.CARDS["Thermhibou"][3])
	$Cards_explanation/Panel/Page1/Thermhibou/Mana.text = "Mana :\n" + str(card_database_reference.CARDS["Thermhibou"][0])
	$Cards_explanation/Panel/Page1/Thermhibou/SocCost.text = "Social :\n" + str(card_database_reference.CARDS["Thermhibou"][1])
	$Cards_explanation/Panel/Page1/Thermhibou/EnvCost.text = "Env. :\n" + str(card_database_reference.CARDS["Thermhibou"][2])
	$Cards_explanation/Panel/Page1/Nuclearo/Description.text = "Description :\n" + card_database_reference.CARDS["Nuclearo"][4]
	$Cards_explanation/Panel/Page1/Nuclearo/Dmg.text = "Dégâts :\n" + str(card_database_reference.CARDS["Nuclearo"][3])
	$Cards_explanation/Panel/Page1/Nuclearo/Mana.text = "Mana :\n" + str(card_database_reference.CARDS["Nuclearo"][0])
	$Cards_explanation/Panel/Page1/Nuclearo/SocCost.text = "Social :\n" + str(card_database_reference.CARDS["Nuclearo"][1])
	$Cards_explanation/Panel/Page1/Nuclearo/EnvCost.text = "Env. :\n" + str(card_database_reference.CARDS["Nuclearo"][2])
	$Cards_explanation/Panel/Page2/Panolero/Description.text = "Description :\n" + card_database_reference.CARDS["Panolero"][4]
	$Cards_explanation/Panel/Page2/Panolero/Dmg.text = "Dégâts :\n" + str(card_database_reference.CARDS["Panolero"][3])
	$Cards_explanation/Panel/Page2/Panolero/Mana.text = "Mana :\n" + str(card_database_reference.CARDS["Panolero"][0])
	$Cards_explanation/Panel/Page2/Panolero/SocCost.text = "Social :\n" + str(card_database_reference.CARDS["Panolero"][1])
	$Cards_explanation/Panel/Page2/Panolero/EnvCost.text = "Env. :\n" + str(card_database_reference.CARDS["Panolero"][2])
	$Cards_explanation/Panel/Page2/AmigoTri/Description.text = "Description :\n" + card_database_reference.CARDS["Amigo Tri"][4]
	$Cards_explanation/Panel/Page2/AmigoTri/Dmg.text = "Dégâts :\n" + str(card_database_reference.CARDS["Amigo Tri"][3])
	$Cards_explanation/Panel/Page2/AmigoTri/Mana.text = "Mana :\n" + str(card_database_reference.CARDS["Amigo Tri"][0])
	$Cards_explanation/Panel/Page2/AmigoTri/SocCost.text = "Social :\n" + str(card_database_reference.CARDS["Amigo Tri"][1])
	$Cards_explanation/Panel/Page2/AmigoTri/EnvCost.text = "Env. :\n" + str(card_database_reference.CARDS["Amigo Tri"][2])
	$Cards_explanation/Panel/Page2/NuclearoDestructo/Description.text = "Description :\n" + card_database_reference.CARDS["Nuclearo Destructo"][4]
	$Cards_explanation/Panel/Page2/NuclearoDestructo/Dmg.text = "Dégâts :\n" + str(card_database_reference.CARDS["Nuclearo Destructo"][3])
	$Cards_explanation/Panel/Page2/NuclearoDestructo/Mana.text = "Mana :\n" + str(card_database_reference.CARDS["Nuclearo Destructo"][0])
	$Cards_explanation/Panel/Page2/NuclearoDestructo/SocCost.text = "Social :\n" + str(card_database_reference.CARDS["Nuclearo Destructo"][1])
	$Cards_explanation/Panel/Page2/NuclearoDestructo/EnvCost.text = "Env. :\n" + str(card_database_reference.CARDS["Nuclearo Destructo"][2])
	$Cards_explanation/Panel/Page2/TaxitoGratuito/Description.text = "Description :\n" + card_database_reference.CARDS["Taxito Gratuito"][4]
	$Cards_explanation/Panel/Page2/TaxitoGratuito/Dmg.text = "Dégâts :\n" + str(card_database_reference.CARDS["Taxito Gratuito"][3])
	$Cards_explanation/Panel/Page2/TaxitoGratuito/Mana.text = "Mana :\n" + str(card_database_reference.CARDS["Taxito Gratuito"][0])
	$Cards_explanation/Panel/Page2/TaxitoGratuito/SocCost.text = "Social :\n" + str(card_database_reference.CARDS["Taxito Gratuito"][1])
	$Cards_explanation/Panel/Page2/TaxitoGratuito/EnvCost.text = "Env. :\n" + str(card_database_reference.CARDS["Taxito Gratuito"][2])
	$Cards_explanation/Panel/Page3/ClimatoFroido/Description.text = "Description :\n" + card_database_reference.CARDS["Climato Froido"][4]
	$Cards_explanation/Panel/Page3/ClimatoFroido/Dmg.text = "Dégâts :\n" + str(card_database_reference.CARDS["Climato Froido"][3])
	$Cards_explanation/Panel/Page3/ClimatoFroido/Mana.text = "Mana :\n" + str(card_database_reference.CARDS["Climato Froido"][0])
	$Cards_explanation/Panel/Page3/ClimatoFroido/SocCost.text = "Social :\n" + str(card_database_reference.CARDS["Climato Froido"][1])
	$Cards_explanation/Panel/Page3/ClimatoFroido/EnvCost.text = "Env. :\n" + str(card_database_reference.CARDS["Climato Froido"][2])
	$Cards_explanation/Panel/Page3/ForestoAnouvo/Description.text = "Description :\n" + card_database_reference.CARDS["Foresto Anouvo"][4]
	$Cards_explanation/Panel/Page3/ForestoAnouvo/Dmg.text = "Dégâts :\n" + str(card_database_reference.CARDS["Foresto Anouvo"][3])
	$Cards_explanation/Panel/Page3/ForestoAnouvo/Mana.text = "Mana :\n" + str(card_database_reference.CARDS["Foresto Anouvo"][0])
	$Cards_explanation/Panel/Page3/ForestoAnouvo/SocCost.text = "Social :\n" + str(card_database_reference.CARDS["Foresto Anouvo"][1])
	$Cards_explanation/Panel/Page3/ForestoAnouvo/EnvCost.text = "Env. :\n" + str(card_database_reference.CARDS["Foresto Anouvo"][2])
	$Cards_explanation/Panel/RightPage2.visible = false
	$Cards_explanation/Panel/LeftPage2.visible = false
	$Cards_explanation/Panel/LeftPage3.visible = false
	$Cards_explanation/Panel/Page2.visible = false
	$Cards_explanation/Panel/Page3.visible = false

func _on_yes_pressed() -> void:
	get_tree().quit()


func _on_exit_pressed() -> void:
	$Confirmation_quit.visible = true


func _on_no_pressed() -> void:
	$Confirmation_quit.visible = false


func _on_main_menu_pressed() -> void:
	$Confirmation_quit_to_menu.visible = true


func _on_no_menu_pressed() -> void:
	$Confirmation_quit_to_menu.visible = false


func _on_yes_menu_pressed() -> void:
	scene_transition_animation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_back_pressed() -> void:
	$Options_panel.visible = false


func _on_options_pressed() -> void:
	$Options_panel.visible = true


func _on_help_pressed() -> void:
	$Cards_explanation.visible = true


func _on_back_cards_explanation_pressed() -> void:
	$Cards_explanation.visible = false


func _on_right_page_1_pressed() -> void:
	$Cards_explanation/Panel/RightPage1.visible = false
	$Cards_explanation/Panel/RightPage2.visible = true
	$Cards_explanation/Panel/LeftPage2.visible = true
	$Cards_explanation/Panel/Page1.visible = false
	$Cards_explanation/Panel/Page2.visible = true


func _on_right_page_2_pressed() -> void:
	$Cards_explanation/Panel/RightPage2.visible = false
	$Cards_explanation/Panel/LeftPage2.visible = false
	$Cards_explanation/Panel/LeftPage3.visible = true
	$Cards_explanation/Panel/Page2.visible = false
	$Cards_explanation/Panel/Page3.visible = true


func _on_left_page_2_pressed() -> void:
	$Cards_explanation/Panel/Page2.visible = false
	$Cards_explanation/Panel/Page1.visible = true
	$Cards_explanation/Panel/LeftPage2.visible = false
	$Cards_explanation/Panel/RightPage2.visible = false
	$Cards_explanation/Panel/RightPage1.visible = true


func _on_left_page_3_pressed() -> void:
	$Cards_explanation/Panel/Page3.visible = false
	$Cards_explanation/Panel/Page2.visible = true
	$Cards_explanation/Panel/LeftPage3.visible = false
	$Cards_explanation/Panel/LeftPage2.visible = true
	$Cards_explanation/Panel/RightPage2.visible = true
