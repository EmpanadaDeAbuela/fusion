extends Node2D

@onready var sprite = $"../Sprite2D"
@onready var collision = $"../collision"
@onready var explosionRange = $"../explosionRango"
@onready var area = $"../Area2D"
#@onready var bola = get_parent()

#var sprite0 = preload("res://Sprites/Void_Heart.png")
#var sprite1 = preload("res://Sprites/Dream_Wielder.png")
#var sprite2 = preload("res://Sprites/Fragile_Heart.png")
#var sprite3 = preload("res://Sprites/Spore_Shroom.png")
#var sprite4 = preload("res://Sprites/Unbreakable_Heart.png")
#var sprite5 = preload("res://Sprites/Dreamshield.png")

func _ready() -> void:
	setSprite(0)

func agrandar(cant:int):
	sprite.scale = sprite.scale*cant/2
	collision.scale = collision.scale*cant/2
	area.scale = area.scale*cant/2
	explosionRange.scale = explosionRange.scale*cant/2

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
			#sprite.texture = sprite0
			agrandar(type+1)
		1:
			sprite.modulate = Color.DARK_ORANGE
			#sprite.texture = sprite1
			agrandar(type+1)
		2:
			sprite.modulate = Color.YELLOW
			#sprite.texture = sprite2
			agrandar(type+1)
		3:
			sprite.modulate = Color.GREEN
			#sprite.texture = sprite3
			agrandar(type+1)
		4:
			sprite.modulate = Color.BLUE
			#sprite.texture = sprite4
			agrandar(type+1)
		5:
			sprite.modulate = Color.PURPLE
			#sprite.texture = sprite5
			agrandar(type+1)
		
			
