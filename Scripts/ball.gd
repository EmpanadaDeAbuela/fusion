extends RigidBody2D

var id : int

func _ready() -> void:
	generarID()
	

func generarID():
	id = randf_range(0, 999999999) #por si acaso viste
	#print("id al crearse:" +  str(id))

func getId():
	return id
