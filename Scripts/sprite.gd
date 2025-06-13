extends Node2D

@onready var sprite = $"../Sprite2D"
@onready var collision = $"../collision"
@onready var explosionRange = $"../explosionRango"
@onready var area = $"../Area2D"
@onready var label = $"../Label"

var rojo = preload("res://Sprites/bolas/rojo.png")
var verde = preload("res://Sprites/bolas/verde.png")
var cian = preload("res://Sprites/bolas/cian.png")
var azul = preload("res://Sprites/bolas/azul.png")
var violeta = preload("res://Sprites/bolas/violeta.png")


var instanciadaDesdeEditor := false
#static var sizes = []

func _ready() -> void:
	call_deferred("setSprite", false)
	#label.text = str(get_parent().get_meta("type"))
	
#func _process(delta: float) -> void:
#	if Input.is_action_just_pressed("ui_accept"):
#		setSprite(0)

func agrandar(cant:float):
	
	var vectorCant = Vector2(1.5*cant, 1.5*cant)
	
	#bola.scale = vectorCant
	sprite.scale = vectorCant/22
	collision.scale = vectorCant
	area.scale = vectorCant
	explosionRange.scale = vectorCant

func setRandomMeta():
	var type = randi() % 6
	get_parent().set_meta("type", type)
	
func setSprite(setRandomONo:bool): 
	
	if setRandomONo or instanciadaDesdeEditor: 
		setRandomMeta()
	
	var type = get_parent().get_meta("type")
	
	match type:
		0:
			sprite.texture = rojo
			#sprite.modulate = Color.RED
			agrandar(2.5)
		1:
			sprite.texture = rojo
			sprite.modulate = Color.DARK_ORANGE
			agrandar(2)
		2:
			sprite.texture = verde
			#sprite.modulate = Color.YELLOW
			agrandar(1.5)
		3:
			sprite.texture = cian
			#sprite.modulate = Color.GREEN
			agrandar(1.2)
		4:
			sprite.texture = azul
			#sprite.modulate = Color.BLUE
			agrandar(1)
		5:
			sprite.texture = violeta
			#sprite.modulate = Color.PURPLE
			agrandar(0.8)

func setComponents():
	sprite = $"../Sprite2D"
	collision = $"../collision"
	explosionRange = $"../explosionRango"
	area = $"../Area2D"
