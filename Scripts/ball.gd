extends RigidBody2D

var id : int
@onready var fision = $fision

func _ready() -> void:
	generarID()
	

func generarID():
	id = randf_range(0, 999999999) #por si acaso viste
	#print("id al crearse:" +  str(id))

func getId():
	return id

func omnidirectionalForce():
	fision.call_deferred("omnidirectionalForce")
