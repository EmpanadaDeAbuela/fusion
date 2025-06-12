extends Node2D

var bola = preload("res://Prefabs/ball.tscn")
@onready var main = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space") and !main.nivelTerminado:
		instanciarBola()

func instanciarBola():
	var bolaInstancia = bola.instantiate()
	#bolaInstancia.get_node("fision").clickManager = $clickManager
	bolaInstancia.global_position = global_position
	bolaInstancia.initBola(true)
	get_parent().call_deferred("add_child", bolaInstancia)
	
