extends Node2D

@onready var label = $"../Label"

var clicks = 3
var listaBolas = []
var sePuedeJugar = false

func _ready() -> void:
	SignalManager.connect("sumarClicks", sumarClicks)
	SignalManager.connect("darPresente", ponerPresente)
	SignalManager.connect("darAusente", ponerAusente)
	SignalManager.connect("meQuedeQuieto", seQuedoQuieto)
	SignalManager.connect("pedirPuntos", emitirPuntos)
	SignalManager.connect("jugar", empezar)

func empezar(sePuede:bool):
	sePuedeJugar = sePuede


func _process(delta: float) -> void:
	label.text = str(clicks)
	#print(listaBolas)

func emitirPuntos():
	SignalManager.emit_signal("mandarPuntos", clicks)

func getClicks():
	return clicks
	
func sumarClicks(cant:int):
	if sePuedeJugar:
		clicks += cant

func restarClicks(cant:int):
	if sePuedeJugar:
		clicks -= cant

func emitClickAmount():
	SignalManager.emit_signal("clickAmount", clicks)

func ponerPresente():
	listaBolas.append(false)

func ponerAusente():
	pass
	#listaBolas.erase(listaBolas.back())

func seQuedoQuieto():
	listaBolas.erase(listaBolas.back())
	listaBolas.append(true)
