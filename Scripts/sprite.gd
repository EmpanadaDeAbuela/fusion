extends Node2D

@onready var sprite = $"../Sprite2D"
@onready var collision = $"../collision"
@onready var explosionRange = $"../explosionRango"
@onready var area = $"../Area2D"
@onready var bola = $".."
#@onready var bola = get_parent()

#var sprite0 = preload("res://Sprites/Void_Heart.png")
#var sprite1 = preload("res://Sprites/Dream_Wielder.png")
#var sprite2 = preload("res://Sprites/Fragile_Heart.png")
#var sprite3 = preload("res://Sprites/Spore_Shroom.png")
#var sprite4 = preload("res://Sprites/Unbreakable_Heart.png")
#var sprite5 = preload("res://Sprites/Dreamshield.png")

static var sizes = []

func _ready() -> void:
	call_deferred("setSprite", 0)

func agrandar(cant:float):
	
	var vectorCant = Vector2(cant, cant)
	
	#bola.scale = vectorCant
	sprite.scale = vectorCant/22
	collision.scale = vectorCant
	area.scale = vectorCant
	explosionRange.scale = vectorCant

func setSprite(opcion:int): 
	
	#si es 0 es desde el ready (se genera type aleatorioamente)
	#si es 1 es porque se fusionón (se le asigna dependdiedo los padres)
	
	var type 
	
	if opcion == 0:
		type = randi() % 6
		get_parent().set_meta("type", type)
		
	elif opcion == 1:
		type = get_parent().get_meta("type")
	
	match type:
		0:
			sprite.modulate = Color.RED
			agrandar(0.8)
		1:
			sprite.modulate = Color.DARK_ORANGE
			agrandar(1)
		2:
			sprite.modulate = Color.YELLOW
			agrandar(1.2)
		3:
			sprite.modulate = Color.GREEN
			agrandar(1.5)
		4:
			sprite.modulate = Color.BLUE
			agrandar(2)
		5:
			sprite.modulate = Color.PURPLE
			agrandar(2.5)

func setComponents():
	sprite = $"../Sprite2D"
	collision = $"../collision"
	explosionRange = $"../explosionRango"
	area = $"../Area2D"
