extends CanvasLayer


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/how_play/how_play.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
	

	
