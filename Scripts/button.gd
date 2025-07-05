extends TextureButton


func _ready() -> void:
	SignalManager.connect("nivelTerminado", desactivar)

func desactivar():
	disabled = true

func _on_pressed() -> void:
	aparecerPantallaFinal()

func aparecerPantallaFinal():
	
	var tween := create_tween()
	tween.tween_property($"../blackLayer", "modulate", Color(1, 1, 1, 150.0 / 255.0), 1.0)
	
	var tween2 = create_tween()
	tween2.tween_property($"../Node2/pantallaFinal", "position", Vector2(0, 0), 1.0) #$"../pantallaFinal"
	
	SignalManager.emit_signal("pedirPuntos")
	SignalManager.emit_signal("nivelTerminado")
	
