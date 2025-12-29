extends CanvasLayer


func _on_main_manu_pressed() -> void:
	Globals.reset()
	get_tree().change_scene_to_file("res://UI/main_menu/main_menu.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
