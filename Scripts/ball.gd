extends RigidBody2D

#@onready var clickManager = $"../clickManager"

signal fusion(meta:int);

func emitirSeñal():
	emit_signal("fusion", get_meta("type") )

#func getClicks():
#	print(clickManager)
#	return clickManager.getClicks()
