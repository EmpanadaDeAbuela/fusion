extends Node2D

@onready var sprite = $"../Sprite2D"
@onready var collision = $"../collision"
@onready var explosionRange = $"../explosionRango"
@onready var area = $"../Area2D"
@onready var label = $"../Label"

var bronce = preload("res://Sprites/bolas/bronce.png")
var verde = preload("res://Sprites/bolas/verde.png")
var azul = preload("res://Sprites/bolas/azul.png")
var violeta = preload("res://Sprites/bolas/violeta.png")
var cian = preload("res://Sprites/bolas/cian.png")
var rojo = preload("res://Sprites/bolas/rojo.png")
var dorado = preload("res://Sprites/bolas/golden.png")

var piedra = preload("res://Sprites/bolas/piedra.png")

var instanciadaDesdeEditor := false

var pointTable:PointsResource = preload("res://Resources/pointsTable.tres")

func _ready() -> void:
	call_deferred("setSprite", false)
	#label.text = str(get_parent().get_meta("type"))
	
func _process(delta: float) -> void:
	sprite.rotation = -get_parent().rotation #este código no sé si será el más eficiente pero funciona

func agrandar(cant:float):
	
	var vectorCant = Vector2(cant, cant)
	
	#bola.scale = vectorCant
	sprite.scale = vectorCant/9.5
	
	collision.scale = vectorCant
	area.scale = vectorCant #explosion
	explosionRange.scale = vectorCant*0.75 #extra?

func setRandomMeta():
	
	var type = randi() % 7
	
	var level = pointTable.getLevel()
	
	var stoneChance = (level-1) * 0.05
	#level = 1 => chance = 0/10
	#level = 2 => chance = 0,5/10
	#level = 3 => chance = 1/10
	#...
	#level = 19 => chance = 9,5/10
	
	if randf() < stoneChance:
		type = 7
	
	get_parent().set_meta("type", type)

func setSprite(setRandomONo:bool): 
	
	if setRandomONo or instanciadaDesdeEditor: 
		setRandomMeta()
	
	var type = get_parent().get_meta("type")
	
	match type:
		0:
			sprite.texture = bronce
			agrandar(3)
		1:
			sprite.texture = verde
			agrandar(2.6)
		2:
			sprite.texture = azul
			agrandar(2.3)
		3:
			sprite.texture = violeta
			agrandar(2)
		4:
			sprite.texture = cian
			agrandar(1.6)
		5:
			sprite.texture = rojo
			#sprite.modulate = Color.PURPLE
			agrandar(1.3)
		6:
			sprite.texture = dorado
			agrandar(1)
		7:
			sprite.texture = piedra
			agrandar(3/pointTable.getLevel())
			
func setComponents():
	sprite = $"../Sprite2D"
	collision = $"../collision"
	explosionRange = $"../explosionRango"
	area = $"../Area2D"
