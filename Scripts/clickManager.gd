extends Node2D

@onready var label = $"../Label"

var clicks = 3

func _process(delta: float) -> void:
	label.text = str(clicks)

func getClicks():
	return clicks
	
func setClicks(newclicks:int):
	clicks = newclicks

func restClicks():
	clicks = clicks - 1
