extends Node2D

@onready var sprite = $"../Sprite2D"
@onready var collision = $"../collision"
@onready var explosionRange = $"../explosionRango"
@onready var area = $"../Area2D"
@onready var label = $"../Label"

#bronce
#verde
#azul
#violeta
#cian
#rojo
#dorado


var bronce = preload("res://Sprites/bolas/bronce.png")
var verde = preload("res://Sprites/bolas/verde.png")
var azul = preload("res://Sprites/bolas/azul.png")
var violeta = preload("res://Sprites/bolas/violeta.png")
var cian = preload("res://Sprites/bolas/cian.png")
var rojo = preload("res://Sprites/bolas/rojo.png")
var dorado = preload("res://Sprites/bolas/golden.png")


var instanciadaDesdeEditor := false
#static var sizes = []

func _ready() -> void:
	call_deferred("setSprite", false)
	#label.text = str(get_parent().get_meta("type"))
	
func _process(delta: float) -> void:
	sprite.rotation = -get_parent().rotation #este código no sé si será el más eficiente pero funciona

func agrandar(cant:float):
	
	var vectorCant = Vector2(1.5*cant, 1.5*cant)
	
	#bola.scale = vectorCant
	sprite.scale = vectorCant/9.5
	collision.scale = vectorCant
	area.scale = vectorCant
	explosionRange.scale = vectorCant

func setRandomMeta():
	var type = randi() % 7
	get_parent().set_meta("type", type)
	
func setSprite(setRandomONo:bool): 
	
	if setRandomONo or instanciadaDesdeEditor: 
		setRandomMeta()
	
	var type = get_parent().get_meta("type")
	
	match type:
		0:
			sprite.texture = bronce
			agrandar(2.5)
		1:
			sprite.texture = verde
			agrandar(2.25)
		2:
			sprite.texture = azul
			agrandar(2)
		3:
			sprite.texture = violeta
			agrandar(1.75)
		4:
			sprite.texture = cian
			agrandar(1.5)
		5:
			sprite.texture = rojo
			#sprite.modulate = Color.PURPLE
			agrandar(1.25)
		6:
			sprite.texture = dorado
			agrandar(1)
		#7:
		#	sprite.texture = rosa
		#	agrandar(0.75)

func setComponents():
	sprite = $"../Sprite2D"
	collision = $"../collision"
	explosionRange = $"../explosionRango"
	area = $"../Area2D"
