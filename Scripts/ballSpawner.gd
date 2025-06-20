extends Node2D

var bola = preload("res://Prefabs/ball.tscn")
@onready var main = get_parent().get_parent()

var sePuedeJugar = false

func _ready() -> void:
	SignalManager.connect("instanciarBola", onInstanciarBola)
	SignalManager.connect("jugar", empezar)
	
	Engine.time_scale = 5.0
	for n in 30:
		await get_tree().create_timer(1.0).timeout
		instanciarBola()
	
	SignalManager.emit_signal("jugar", true)
	Engine.time_scale = 1.0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space") and !main.nivelTerminado:
		instanciarBola()

func empezar(sePuede:bool):
	sePuedeJugar = sePuede

func instanciarBola():
	var bolaInstancia = bola.instantiate()
	bolaInstancia.global_position.y = global_position.y
	bolaInstancia.global_position.x = randf_range(-450.0, 250.0)
	bolaInstancia.initBola(true)
	get_parent().call_deferred("add_child", bolaInstancia)

func onInstanciarBola():
	if sePuedeJugar:
		instanciarBola()
