extends TextureButton



func _ready():
	scale *= $'../../'.card_size/size
	disabled = true
