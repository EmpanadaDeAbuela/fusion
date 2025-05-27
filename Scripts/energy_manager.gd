extends Node2D

@onready var label = $"../Label"

var energy : int

func _ready() -> void:
	energy = 0

	
func aumentarEnergy(cant:int):
	energy += cant
	label.text = str(energy)
