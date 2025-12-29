extends Node

var music_player: AudioStreamPlayer
var is_music_enabled: bool = true

func _ready():
	load_settings()
	
	music_player = AudioStreamPlayer.new()
	add_child(music_player)
	
	var music_stream = load("res://music/eona-emotional-ambient-pop-351436 short1.mp3")
	music_player.stream = music_stream
	music_player.volume_db = -20.0 if is_music_enabled else -80.0
	
	music_player.finished.connect(_on_music_finished)
	
	if is_music_enabled:
		music_player.play()

func toggle_music():
	is_music_enabled = !is_music_enabled
	
	if is_music_enabled:
		music_player.volume_db = -20.0
		if not music_player.playing:
			music_player.play()
	else:
		music_player.volume_db = -80.0
	
	save_settings()
	return is_music_enabled

func _on_music_finished():
	music_player.play()

func save_settings():
	var config = ConfigFile.new()
	config.set_value("audio", "music_enabled", is_music_enabled)
	config.save("user://audio_settings.cfg")

func load_settings():
	var config = ConfigFile.new()
	var error = config.load("user://audio_settings.cfg")
	if error == OK:
		is_music_enabled = config.get_value("audio", "music_enabled", true)
