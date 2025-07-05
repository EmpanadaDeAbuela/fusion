extends Control

#@onready var label2 = $VBoxContainer/Label2

var tablaPuntos:PointsResource = preload("res://Resources/pointsTable.tres")
var puntosPuente = 0

func _ready() -> void:
	
	SignalManager.connect("mandarPuntos", setearPuntaje)

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _on_replay_button_pressed() -> void:
	tablaPuntos.nextLevel()
	tablaPuntos.setBallAmount(int(puntosPuente/3))
	get_tree().reload_current_scene()
	
	#print(tablaPuntos.getBallAmount())

func setearPuntaje(puntos:int):
	puntosPuente = puntos
	var label = find_child("Label2", true, false)
	if label:
		label.text = str(puntos)
	
