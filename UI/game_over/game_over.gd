extends CanvasLayer


func _on_button_pressed():
	Globals.reset()
	get_tree().reload_current_scene()
	


func _on_button_2_pressed() -> void:
	Globals.reset()
	get_tree().change_scene_to_file("res://UI/main_menu/main_menu.tscn")
