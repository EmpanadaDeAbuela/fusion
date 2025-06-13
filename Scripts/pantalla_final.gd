extends Control

func _ready() -> void:
	SignalManager.connect("mandarPuntos", setearPuntaje)

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_replay_button_pressed() -> void:
	get_tree().reload_current_scene()

func setearPuntaje(puntos:int):
	$VBoxContainer/Label2.text = str(puntos)
	
