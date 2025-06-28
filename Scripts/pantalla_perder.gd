extends Control

func _ready() -> void:
	SignalManager.connect("noHayMasClicks", aparecerPantallaFinal)

func aparecerPantallaFinal():
	var tween := create_tween()
	tween.tween_property($"../blackLayer", "modulate", Color(1, 1, 1, 150.0 / 255.0), 1.0)
	
	var tween2 = create_tween()
	tween2.tween_property(self, "position", Vector2(0, 0), 1.0)
	
	SignalManager.emit_signal("nivelTerminado")
