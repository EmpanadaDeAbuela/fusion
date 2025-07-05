extends Control

func _ready() -> void:
	SignalManager.connect("inGameMenu", aparecerMenu)

func aparecerMenu(aparecer:bool):
	
	print(aparecer)
	
	var tween := create_tween()
	
	if aparecer:
		
		tween.tween_property($"../../blackLayer", "modulate", Color(1, 1, 1, 150.0 / 255.0), 1.0)
		
		var tween2 = create_tween()
		tween2.tween_property(self, "position", Vector2(-1280/2, -320), 1.0) #$"../pantallaInGameMenu"
	else:
		print("aparecer es falso")
		
		tween.tween_property($"../../blackLayer", "modulate", Color(0, 0 , 0, 150.0 / 255.0), 1.0)
		
		var tween2 = create_tween()
		tween2.tween_property(self, "position", Vector2(667, -320), 1.0) #$"../pantallaInGameMenu"
