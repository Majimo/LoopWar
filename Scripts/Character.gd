extends Node2D

onready var character_path = $"CharacterPath"
onready var visual_path = $"VisualCharacterPath"

func _ready():
	var points = [
		Vector2(200, 200), 
		Vector2(850, 200), 
		Vector2(850, 400), 
		Vector2(200, 400), 
		Vector2(200, 200)]
	for point in points:
		character_path.curve.add_point(point)
		visual_path.add_point(point)
