extends Node2D

onready var character_path = $"CharacterPath"
onready var visual_path = $"VisualCharacterPath"


#### METHODS ####

func _ready():
	var points = [
		Vector2(50, 50), 
		Vector2(750, 50), 
		Vector2(750, 550), 
		Vector2(50, 550), 
		Vector2(50, 50)]
	for point in points:
		character_path.curve.add_point(point)
		draw_path(point)

func draw_path(point: Vector2):
	visual_path.add_point(point)
	visual_path.set_width(16)
	visual_path.set_default_color(Color( 0.82, 0.41, 0.12, 1 ))
	visual_path.set_joint_mode(2)
	visual_path.set_begin_cap_mode(2)
	visual_path.set_end_cap_mode(2)
