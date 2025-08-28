extends TextureButton


var deck_size = INF

func _ready():
	scale *= $"../../".card_size/size
	


func _gui_input(_event):
	if Input.is_action_just_released("leftclick"):
		if deck_size > 0:
			deck_size = $"../../".drawcard()
			if deck_size == 0:
				disabled = true
