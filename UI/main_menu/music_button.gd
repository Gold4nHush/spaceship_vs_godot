extends TextureButton

@onready var icon_on: Texture2D = preload("res://icons/music_on.png")
@onready var icon_off: Texture2D = preload("res://icons/music_off.png")

func _ready():
	update_icon()
	
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	var music_enabled = AudioManager.toggle_music()
	
	update_icon()

func update_icon():
	if AudioManager.is_music_enabled:
		texture_normal = icon_on
	else:
		texture_normal = icon_off
