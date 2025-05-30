extends RigidBody2D

var id : int

func _ready() -> void:
	pass
	

func generarID():
	id = randf_range(0, 999999999)
