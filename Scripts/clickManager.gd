extends Node2D

@onready var labelClicks = $"../clicks"
@onready var labelClicksToLose = $"../clicksToLose"


var pointTable:PointsResource = preload("res://Resources/pointsTable.tres")

var clicks = pointTable.getBallAmount()
var clicksARestar = 0

var listaBolas = []
var sePuedeJugar = false

var clickedAtLeastOnce = false

func _ready() -> void:
	SignalManager.connect("sumarClicks", sumarClicks)
	SignalManager.connect("pedirPuntos", emitirPuntos)
	SignalManager.connect("jugar", empezar)
	SignalManager.connect("mandarPuntosARestar", previsualizarRestaDePuntos)
	SignalManager.connect("restarClicks", restarClicks)
	
	
	
func empezar(sePuede:bool):
	sePuedeJugar = sePuede

func _process(delta: float) -> void:
	if pointTable.getBallAmount() == 0:
		SignalManager.emit_signal("noHayMasClicks")
		
	if Input.is_action_just_pressed("click") and !clickedAtLeastOnce:
		clickedAtLeastOnce = true
	
	labelClicks.text = str(pointTable.getBallAmount())
	
	if clicksARestar == 0:
		labelClicksToLose.text = ""
	else:
		labelClicksToLose.text = "-" + str(clicksARestar)

func previsualizarRestaDePuntos(puntos:int):
	clicksARestar = pointTable.getPointsLost(puntos)
	#if puntos == -1:
	#	clicksARestar = 0

func emitirPuntos():
	SignalManager.emit_signal("mandarPuntos", pointTable.getBallAmount())

func getClicks():
	return clicks

func sumarClicks(cant:int):
	if sePuedeJugar and clickedAtLeastOnce:
		pointTable.setBallAmount(pointTable.getBallAmount()+cant)

func restarClicks(level:int):
	if sePuedeJugar and clickedAtLeastOnce:
		clicksARestar = pointTable.getPointsLost(level)
		#if (clicks - clicksARestar) >= 0:
		pointTable.setBallAmount(pointTable.getBallAmount()-clicksARestar)
	if pointTable.getBallAmount() <= 0:
		SignalManager.emit_signal("noHayMasClicks")

func clicksAQuedar(level:int):
	return pointTable.getBallAmount() - level

func emitClickAmount():
	SignalManager.emit_signal("clickAmount", clicks)
