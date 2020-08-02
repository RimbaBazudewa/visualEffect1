extends Node2D

onready var bom = preload("res://VisualEffect1/scene/bom.tscn")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton :
		if event.is_pressed():
			add_bom(event.position)

func add_bom(mouse_pos : Vector2):
	print("Add Boom")
	var _bom = bom.instance()
	_bom.position = mouse_pos
	add_child(_bom)



