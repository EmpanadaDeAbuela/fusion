extends Button

func _on_pressed() -> void:
	aparecerMenu()

func aparecerMenu():
	
	var tween := create_tween()
	tween.tween_property($"../blackLayer", "modulate", Color(1, 1, 1, 150.0 / 255.0), 1.0)
	
	var tween2 = create_tween()
	tween2.tween_property($"../Node2/pantallaInGameMenu", "position", Vector2(-1280/2, -640/2), 1.0) #$"../pantallaInGameMenu"
	
	#SignalManager.emit_signal("nivelTerminado")
	#SignalManager.emit_signal("pedirPuntos")
