extends Node2D

var bola = preload("res://Prefabs/ball.tscn")
 
var nivelTerminado = false

var pelotas = []

var pointTable:PointsResource = preload("res://Resources/pointsTable.tres")

func _ready():
	SignalManager.connect("fusionar", fusionar)

func fusionar(token: int, newPosition:Vector2, type:int):
	
	if token in pelotas:
		instanciarPelotaHija(newPosition, type)
		
		SignalManager.emit_signal("sumarClicks", pointTable.getPointsGained(type))
		
		SignalManager.emit_signal("instanciarBola")
	else:
		pelotas.append(token)

func instanciarPelotaHija(newPosition:Vector2, type:int):
	
	var bolaInstancia = bola.instantiate()
	bolaInstancia.get_node("fision").clickManager = $clickManager
	bolaInstancia.global_position = newPosition
	
	bolaInstancia.initBola(false)
	
	if type < 6:
		bolaInstancia.set_meta("type", type+1)
		get_parent().call_deferred("add_child", bolaInstancia) #para que no se loopee
	else:
		bolaInstancia.set_meta("type", 0)
	SoundEffectManager.emitirPop()
		
	#get_parent().call_deferred("add_child", bolaInstancia)
