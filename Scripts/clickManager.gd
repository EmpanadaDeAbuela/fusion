extends Node2D

@onready var label = $"../Label"

var clicks = 5

func _ready() -> void:
	SignalManager.connect("sumarClicks", sumarClicks)
	#SignalManager.connect("clickOnBall", restClicks)
	#emitClickAmount()


func _process(delta: float) -> void:
	label.text = str(clicks)

func getClicks():
	return clicks
	
func sumarClicks(cant:int):
	clicks += cant
	#emitClickAmount()

func restarClicks(cant:int):
	clicks -= cant
	#emitClickAmount()

func emitClickAmount():
	SignalManager.emit_signal("clickAmount", clicks)
