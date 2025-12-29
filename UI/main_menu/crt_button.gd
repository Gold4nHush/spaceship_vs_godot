extends TextureButton

@onready var icon_on: Texture2D = preload("res://icons/crt_on.png")
@onready var icon_off: Texture2D = preload("res://icons/crt_off.png")

func _ready():
	update_icon()
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	CrtLayer.toggle_crt()
	update_icon()

func update_icon():
	if CrtLayer.is_crt_enabled:
		texture_normal = icon_on
	else:
		texture_normal = icon_off
