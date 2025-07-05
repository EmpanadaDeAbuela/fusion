extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		print("GODOTDEMIERDA")
		SignalManager.emit_signal("inGameMenu", false)

func _on_back_pressed() -> void:
	hola()

func hola():
	SignalManager.emit_signal("inGameMenu", false)
