extends Control

var tablaPuntos:PointsResource = preload("res://Resources/pointsTable.tres")
func _ready() -> void:
	SignalManager.connect("noHayMasClicks", aparecerPantallaFinal)

func aparecerPantallaFinal():
	var tween := create_tween()
	tween.tween_property($"../../blackLayer", "modulate", Color(1, 1, 1, 150.0 / 255.0), 1.0)
	
	var tween2 = create_tween()
	tween2.tween_property(self, "position", Vector2(0, 0), 1.0)
	
	SignalManager.emit_signal("nivelTerminado")


func _on_menu_pressed() -> void:
	tablaPuntos.setBallAmount(14)
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_reply_pressed() -> void:
	tablaPuntos.setBallAmount(14)
	get_tree().reload_current_scene()
