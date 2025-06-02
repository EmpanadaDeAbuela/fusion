extends Node2D

@onready var label = $"../Label"

var clicks = 99

func _ready() -> void:
	#SignalManager.connect("clickOnBall", restClicks)
	#emitClickAmount()
	pass

func _process(delta: float) -> void:
	label.text = str(clicks)

func getClicks():
	return clicks
	
func setClicks(newclicks:int):
	clicks = newclicks
	#emitClickAmount()

func restClicks():
	clicks = clicks - 1
	#emitClickAmount()

func emitClickAmount():
	SignalManager.emit_signal("clickAmount", clicks)
