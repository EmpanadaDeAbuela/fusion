extends AudioStreamPlayer

var ping = preload("res://Audio/ping.mp3")
var pop = preload("res://Audio/pop.mp3")

func emitirPing():
	stream = ping
	play()

func emitirPop():
	stream = pop
	play()
