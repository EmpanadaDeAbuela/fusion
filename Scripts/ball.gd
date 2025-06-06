extends RigidBody2D

var id : int
@onready var fision = $fision
@export var instanciadaDesdeEditor := false

func _ready() -> void:
	$sprite.instanciadaDesdeEditor = instanciadaDesdeEditor
	generarID()
	#$Label.text = str(get_meta("type"))

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
