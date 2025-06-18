extends Node2D

@onready var bola = $".."
@onready var fision = $"../fision"
@onready var audio = $"../audio"

#signal setEnergy(nrg:int);

var fusionPoints = 10

func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body is RigidBody2D and body != bola and body.get_meta("type") == get_parent().get_meta("type"):
		
		#SignalManager.emit_signal("darAusente")
		body.queue_free()
		fusionar(generateToken(body.getId()), (global_position+body.global_position)/2, bola.get_meta("type"))
		fision.omnidirectionalForce(2)
	#else:
	#	emitirPing()

func fusionar(token:int, newPosition:Vector2, type):
	SignalManager.emit_signal("fusionar", token, newPosition, type)

func generateToken(otherId:int):
	return otherId * bola.getId()
