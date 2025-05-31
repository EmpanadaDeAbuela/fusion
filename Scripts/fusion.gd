extends Node2D

#@onready var energyManager = $"..../energyManager"
@onready var bola = $".."

signal setEnergy(nrg:int);

var fusionPoints = 10

func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body is RigidBody2D and body != bola: 	#fakin godot te voy a buscar a tu casa y te voy a matar
		#print(str(bola.get_meta("type")) + " " + str(body.get_meta("type")))
		
		if body.get_meta("type") == get_parent().get_meta("type"):
			body.queue_free()
			
			fusionar(generateToken(body.getId()), (global_position+body.global_position)/2)
			queue_free()
			#energyManager.aumentarEnergy(fusionPoints)
			#emit_signal("setEnergy", fusionPoints)

func fusionar(token:int, newPosition:Vector2):
	SignalManager.emit_signal("fusionar", token, newPosition)
	

func generateToken(otherId:int):
	#print(str(otherId) + " + " + str(bola.getId()) + " = " + str(otherId * bola.getId()))
	return otherId * bola.getId()
