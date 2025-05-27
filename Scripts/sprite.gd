extends Node2D

@onready var sprite = $"../Sprite2D"
@onready var collision = $"../collision"
@onready var explosionRange = $"../explosionRango"
@onready var area = $"../Area2D"

var sprite0 = preload("res://Sprites/Void_Heart.png")
var sprite1 = preload("res://Sprites/Dream_Wielder.png")
var sprite2 = preload("res://Sprites/Fragile_Heart.png")
var sprite3 = preload("res://Sprites/Spore_Shroom.png")
var sprite4 = preload("res://Sprites/Unbreakable_Heart.png")
var sprite5 = preload("res://Sprites/Dreamshield.png")

func _ready() -> void:
	var type = randi() % 6
	
	match type:
		0:
			get_parent().set_meta("type", type)
			sprite.texture = sprite0
			agrandar(type+1)
		1:
			get_parent().set_meta("type", type)
			sprite.texture = sprite1
			agrandar(type+1)
		2:
			get_parent().set_meta("type", type)
			sprite.texture = sprite2
			agrandar(type+1)
		3:
			get_parent().set_meta("type", type)
			sprite.texture = sprite3
			agrandar(type+1)
		4:
			get_parent().set_meta("type", type)
			sprite.texture = sprite4
			agrandar(type+1)
		5:
			get_parent().set_meta("type", type)
			sprite.texture = sprite5
			agrandar(type+1)

func agrandar(cant:int):
	sprite.scale = sprite.scale*cant/2
	collision.scale = collision.scale*cant/2
	area.scale = area.scale*cant/2
	explosionRange.scale = explosionRange.scale*cant/2
