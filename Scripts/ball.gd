extends RigidBody2D

var id : int
@onready var fision = $fision
@export var instanciadaDesdeEditor := false
var quieto = false

var tiempo := 0.0
var rebotando := false

var pointTable:PointsResource = preload("res://Resources/pointsTable.tres")

func _ready() -> void:
	#SignalManager.emit_signal("darPresente")
	SignalManager.connect("nivelTerminado", desactivarEscena)
	$sprite.instanciadaDesdeEditor = instanciadaDesdeEditor
	generarID()
	#$Label.text = str(get_meta("type"))
	
	$Label.visible = pointTable.daltonicMode
func _process(delta: float) -> void:
	$Label.text = str(get_meta("type"))
	
	tiempo += delta
	if tiempo >= 0.1:
		tiempo = 0.0
		if get_contact_count() > 0:
			if not rebotando:
				rebotando = true
				#if not SoundEffectManager.playing:
				SoundEffectManager.emitirPing()
		else:
			rebotando = false

func generarID():
	id = randf_range(0, 999999999) #por si acaso viste

func getId():
	return id

func omnidirectionalForce():
	fision.call_deferred("omnidirectionalForce")

func initBola(setRandomONo:bool):
	$sprite.setComponents()
	#$sprite.setRandomMeta()
	$sprite.setSprite(setRandomONo)
	#$Label.text = str(get_meta("type"))

func desactivarEscena():
	queue_free()
