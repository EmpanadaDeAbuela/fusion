extends RigidBody2D

var id : int
@onready var fision = $fision
@export var instanciadaDesdeEditor := false
var quieto = false

func _ready() -> void:
	SignalManager.emit_signal("darPresente")
	SignalManager.connect("nivelTerminado", desactivarEscena)
	$sprite.instanciadaDesdeEditor = instanciadaDesdeEditor
	generarID()
	#$Label.text = str(get_meta("type"))

func _process(delta: float) -> void:
	$Label.text = str(get_meta("type"))
	
	if linear_velocity == Vector2(0,0):
		SignalManager.emit_signal("meQuedeQuieto")

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
