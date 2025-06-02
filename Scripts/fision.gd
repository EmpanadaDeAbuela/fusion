extends Node2D

var hover:= false
@onready var rango =  $"../explosionRango"
var clickManager: Node = null

func _ready():
	
	if clickManager == null:
		clickManager = get_node_or_null("../../clickManager")
		

func _physics_process(delta: float) -> void:
	#print(clicks)
	
	if Input.is_action_just_pressed("click") and hover and clickManager.getClicks() > 0:
		#SignalManager.emit_signal("clickOnBall")
		clickManager.restClicks()
		explode()

func _on_area_2d_mouse_entered() -> void:
	hover = true

func _on_area_2d_mouse_exited() -> void:
	hover = false

#func setClickAmount(clickAmount:int):
#	print(clickAmount)
#	clicks = clickAmount
#	print(clicks)
	

func omnidirectionalForce(divisor:int):
	for body in rango.get_overlapping_bodies():
		#print("Cuerpos dentro del rango: ", rango.get_overlapping_bodies().size())

		if body is RigidBody2D:
			body.sleeping = false  # Despertalo por si acaso
			var dir = (body.global_position - rango.global_position).normalized()
			var fuerza = 1500/divisor
			body.apply_impulse(dir * fuerza, Vector2.ZERO)

func explode():
	omnidirectionalForce(1)
	get_parent().queue_free()
