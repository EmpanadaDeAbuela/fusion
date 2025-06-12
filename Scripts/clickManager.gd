extends Node2D

@onready var label = $"../Label"

var clicks = 5
var listaBolas = []

func _ready() -> void:
	SignalManager.connect("sumarClicks", sumarClicks)
	SignalManager.connect("darPresente", ponerPresente)
	SignalManager.connect("darAusente", ponerAusente)
	SignalManager.connect("meQuedeQuieto", seQuedoQuieto)

func _process(delta: float) -> void:
	label.text = str(clicks)
	#print(listaBolas)

func getClicks():
	return clicks
	
func sumarClicks(cant:int):
	clicks += cant

func restarClicks(cant:int):
	clicks -= cant

func emitClickAmount():
	SignalManager.emit_signal("clickAmount", clicks)

func ponerPresente():
	listaBolas.append(false)

func ponerAusente():
	listaBolas.erase(listaBolas.back())

func seQuedoQuieto():
	listaBolas.erase(listaBolas.back())
	listaBolas.append(true)
