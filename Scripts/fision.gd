extends Node2D

var hover:= false
@onready var rango =  $"../explosionRango"
var clickManager: Node = null
var sprite :Node = null 

var pointTable:PointsResource = preload("res://Resources/pointsTable.tres")

func _ready():
	
	if clickManager == null:
		clickManager = get_node_or_null("../../../clickManager")
	if sprite == null:
		sprite = get_parent().get_node("Sprite2D")

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("click") and hover and clickManager.getClicks() > 0:
		
		SignalManager.emit_signal("restarClicks", get_parent().get_meta("type"))
		explode()

func _on_area_2d_mouse_entered() -> void:
	hover = true
	SignalManager.emit_signal("mandarPuntosARestar", get_parent().get_meta("type"))
	sprite.modulate = Color(0.5, 0.5, 0.5) 

func _on_area_2d_mouse_exited() -> void:
	hover = false
	SignalManager.emit_signal("mandarPuntosARestar", -1)
	sprite.modulate = Color(1, 1, 1)

func omnidirectionalForce(fuerza:int):
	
	for body in rango.get_overlapping_bodies():
		if body is RigidBody2D:
			body.sleeping = false 
			var dir = (body.global_position - rango.global_position).normalized()
			body.apply_impulse(dir * fuerza, Vector2.ZERO)

func explode():
	omnidirectionalForce(pointTable.getImpulseForsePerLevel(get_parent().get_meta("type")))
	SignalManager.emit_signal("mandarPuntosARestar", -1)
	get_parent().queue_free()
