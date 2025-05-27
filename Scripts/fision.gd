extends Node2D

var hover:= false
@onready var rango =  $"../explosionRango"
#@onready var bola = $".."
@onready var clickManager = $"../../clickManager"


func _physics_process(delta: float) -> void:
	print(clickManager.getClicks())
	
	if Input.is_action_just_pressed("click") and hover and clickManager.getClicks() > 0:
		clickManager.restClicks()
		explode()

func _on_area_2d_mouse_entered() -> void:
	hover = true


func _on_area_2d_mouse_exited() -> void:
	hover = false



func explode():
	
	for body in rango.get_overlapping_bodies():
		#print("Cuerpos dentro del rango: ", rango.get_overlapping_bodies().size())

		if body is RigidBody2D:
			body.sleeping = false  # Despertalo por si acaso
			var dir = (body.global_position - rango.global_position).normalized()
			var fuerza = 1500
			body.apply_impulse(dir * fuerza, Vector2.ZERO)

	get_parent().queue_free()


#func _on_explosion_rango_body_entered(body: Node2D) -> void:
#	print(get_parent().name + " " + body.name)
#	if body is RigidBody2D:
#		body.apply_impulse(Vector2.UP * 2352, Vector2.ZERO)
