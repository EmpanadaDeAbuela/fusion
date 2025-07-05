extends Node2D

var bola = preload("res://Prefabs/ball.tscn")
 
var nivelTerminado = false

var pelotas = []

var pointTable:PointsResource = preload("res://Resources/pointsTable.tres")

func _ready():
	SignalManager.connect("fusionar", fusionar)
	SignalManager.connect("inicioJugada", inicioJugada)
	$clicks2.text = "round: " + str(pointTable.getLevel())

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")

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

var interrumpido := false

func inicioJugada():
	
	interrumpido = false
	
	var timer := get_tree().create_timer(5.0)
	
	if not SignalManager.is_connected("ocurrioFusion", self._on_fusionar):
		SignalManager.connect("ocurrioFusion", self._on_fusionar)
	
	await timer.timeout
	
	if not interrumpido:
		jugadaInutil()

func _on_fusionar():
	#print("casi sos un bot pero no")
	interrumpido = true

func jugadaInutil():
	pass
	#print("que bot que sos")
	#SignalManager.emit_signal("mandarPuntosARestar", -2)


func _on_menu_button_pressed() -> void:
	SignalManager.emit_signal("inGameMenu", true)
