extends Control



func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/settings_menu.tscn")


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_how_to_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/howToMenu.tscn")
