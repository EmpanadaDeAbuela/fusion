extends Node2D

@onready var rango = $"../explosionRango"
@onready var shape = $"../explosionRango/CollisionShape2D".shape
@onready var explosionRango = $"../explosionRango"

func _ready() -> void:
	SignalManager.connect("fisionar", romperse)

func romperse(posicionPelota:Vector2):
	if estaDentroDeArea(posicionPelota) and get_parent().get_meta("type") == 7:
		get_parent().queue_free()

func estaDentroDeArea(point: Vector2) -> bool:
	var local_point = explosionRango.to_local(point)
	
	var transformArea = explosionRango.get_global_transform()
	
	return local_point.distance_to(Vector2.ZERO) <= shape.radius
	#return shape is Shape2D and shape.collide_point(point, transformArea)
