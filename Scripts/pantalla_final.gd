extends Control



func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_replay_button_pressed() -> void:
	get_tree().reload_current_scene()
