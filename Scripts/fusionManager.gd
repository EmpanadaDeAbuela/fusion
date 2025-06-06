extends Node2D

var bola = preload("res://Prefabs/ball.tscn")
 
var pelotas = []

func _ready():
	SignalManager.connect("fusionar", fusionar)

func fusionar(token: int, newPosition:Vector2, type:int):
	
	if token in pelotas:
		#pelotas = []
		#print("el id está en pelotas")
		instanciarPelotaHija(newPosition, type)
		
	else:
		#print("el id está vestido")
		pelotas.append(token)

func instanciarPelotaHija(newPosition:Vector2, type:int):
	
	var bolaInstancia = bola.instantiate()
	bolaInstancia.get_node("fision").clickManager = $clickManager
	bolaInstancia.global_position = newPosition
	
	bolaInstancia.initBola(1)
	#bolaInstancia.get_node("sprite").setComponents()
	#bolaInstancia.get_node("sprite").setSprite(1)
	
	if type < 5:
		bolaInstancia.set_meta("type", type+1)
	else:
		bolaInstancia.set_meta("type", 1)
		
	get_parent().call_deferred("add_child", bolaInstancia)
	
