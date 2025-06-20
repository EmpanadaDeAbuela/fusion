extends AudioStreamPlayer

var ping = preload("res://Audio/ping.mp3")
var pop = preload("res://Audio/pop.mp3")

func emitirPing():
	stream = ping
	pitch_scale = randf_range(0.9, 1.1)
	play()

func emitirPop():
	stream = pop
	pitch_scale = 1
	play()
