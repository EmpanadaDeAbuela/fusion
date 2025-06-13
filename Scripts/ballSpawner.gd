extends Node2D

var bola = preload("res://Prefabs/ball.tscn")
@onready var main = $".."

func _ready() -> void:
	for n in 20:
		instanciarBola()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space") and !main.nivelTerminado:
		instanciarBola()

func instanciarBola():
	var bolaInstancia = bola.instantiate()
	bolaInstancia.global_position.y = global_position.y
	bolaInstancia.global_position.x = randf_range(-11.51, -299.115)
	bolaInstancia.initBola(true)
	get_parent().call_deferred("add_child", bolaInstancia)
	
