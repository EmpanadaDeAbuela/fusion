extends Node2D

#@onready var energyManager = $"..../energyManager"
@onready var fusionManager = $fusionManager
@onready var bola = $".."

signal setEnergy(nrg:int);

var fusionPoints = 10

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is RigidBody2D and body != $"..": 	#fakin godot te voy a buscar a tu casa y te voy a matar
		
		if body.get_meta("type") == get_parent().get_meta("type"):
			body.queue_free()
			
			fusionar()
			queue_free()
			#energyManager.aumentarEnergy(fusionPoints)
			#emit_signal("setEnergy", fusionPoints)

func fusionar():
	SignalManager.emit_signal("fusionar")
	
	#$"..".emitirSeñal()

#func getearMeta(bolaInstancia:Node2D):
#		match get_parent().get_meta("type"):
#			0:
#				setearMeta(bolaInstancia, 1)
#			1:
#				setearMeta(bolaInstancia, 2)
#			2:
#				setearMeta(bolaInstancia, 3)
#			3:
#				setearMeta(bolaInstancia, 4)
#			4:
#				setearMeta(bolaInstancia, 5)
#			5:
#				setearMeta(bolaInstancia, 6)

#func setearMeta(bolaInstancia:Node2D, meta:int):
#	bolaInstancia.set_meta("type", meta)
#	print(meta)
	
