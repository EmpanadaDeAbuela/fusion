extends Node2D

var bola = preload("res://Prefabs/ball.tscn")


func fusionar(valor: int):
	var bolaInstancia = bola.instantiate()
	get_parent().call_deferred("add_child", bolaInstancia)
	bolaInstancia.global_position = global_position

#func _ready():
#	await esperar_fusion()




#func esperar_fusion() -> void:
#	var valor = await fusion
#	fusionar(valor)
