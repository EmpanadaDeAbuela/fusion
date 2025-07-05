extends AudioStreamPlayer

var ping = preload("res://Audio/ping.mp3")
var pop = preload("res://Audio/pop.mp3")

@onready var timer = $Timer

var musicValue = 10
var sfxValue = 10

func emitirPing():
	#if timer.is_stopped():
	#	timer.start()
	stream = ping
	pitch_scale = randf_range(0.9, 1.1)
	play()

func emitirPop():
	stream = pop
	pitch_scale = 1
	play()
