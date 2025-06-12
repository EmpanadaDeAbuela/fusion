extends Node2D

var bola = preload("res://Prefabs/ball.tscn")
 
var nivelTerminado = false

var pelotas = []

func _ready():
	SignalManager.connect("fusionar", fusionar)
	SignalManager.connect("nivelTerminado", desactivarEscena)

func fusionar(token: int, newPosition:Vector2, type:int):
	
	if token in pelotas:
		instanciarPelotaHija(newPosition, type)
		sumarClicksDependiendoDeTipo(type)
	else:
		pelotas.append(token)

func instanciarPelotaHija(newPosition:Vector2, type:int):
	
	var bolaInstancia = bola.instantiate()
	bolaInstancia.get_node("fision").clickManager = $clickManager
	bolaInstancia.global_position = newPosition
	
	bolaInstancia.initBola(false)
	
	if type < 5:
		bolaInstancia.set_meta("type", type+1)
	else:
		bolaInstancia.set_meta("type", 0)
		
	get_parent().call_deferred("add_child", bolaInstancia)

func sumarClicksDependiendoDeTipo(type:int):
	SignalManager.emit_signal("sumarClicks", 1)
	
func desactivarEscena():
	
	nivelTerminado = true
	
	for node in get_children():
		if node is RigidBody2D:
			node.queue_free()
