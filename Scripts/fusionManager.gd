extends Node2D

var bola = preload("res://Prefabs/ball.tscn")
 
var pelotas = []

func _ready():
	SignalManager.connect("fusionar", fusionar)

func fusionar(token: int, newPosition:Vector2):
	
	if token in pelotas:
		pelotas = []
		#print("el id está en pelotas")
		instanciarPelotaHija(newPosition)
		
	else:
		#print("el id está vestido")
		pelotas.append(token)

func instanciarPelotaHija(newPosition:Vector2):
	
	var bolaInstancia = bola.instantiate()
	bolaInstancia.get_node("fision").clickManager = $clickManager
	bolaInstancia.global_position = newPosition
	get_parent().call_deferred("add_child", bolaInstancia)
	
	#print("asterisco se instancia")
	#bolaInstancia.global_position = global_position
