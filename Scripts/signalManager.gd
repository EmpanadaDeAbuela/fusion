extends Node

signal fusionar(id:int, position:Vector2, type:int)
signal sumarClicks(cant:int)
signal restarClicks(cant:int)

signal inicioJugada()
signal ocurrioFusion() #sería lo mismo que fusionar pero la otra tiene argumentos, re hardcodeado

signal instanciarBola()

signal nivelTerminado()
signal jugar(sePuede:bool)

signal pedirPuntos()
signal mandarPuntos(puntos:int)

signal mandarPuntosARestar(puntos:int)

signal noHayMasClicks()
