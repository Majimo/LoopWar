extends Node2D

onready var character_path = $"CharacterPath"
onready var visual_path = $"VisualCharacterPath"

var path_points: Array = [
	Vector2(50, 50), 
	Vector2(750, 50), 
	Vector2(750, 550), 
	Vector2(50, 550), 
	Vector2(50, 50)]


#### METHODS ####

func _ready():
	var computed_path_points = randomize_path_points()
	EVENTS.emit_signal("path_points_changed", computed_path_points)
	for point in computed_path_points:
		character_path.curve.add_point(point)
		draw_path(point)

func draw_path(point: Vector2):
	visual_path.add_point(point)
	visual_path.set_width(16)
	visual_path.set_default_color(Color(GAME.orange))
	visual_path.set_joint_mode(2)
	visual_path.set_begin_cap_mode(2)
	visual_path.set_end_cap_mode(2)

func match_points(points: Array, point_idx: int, newPoint: Vector2, num: int, way: bool):
	var newPoint_based_way = newPoint.x + num if way else newPoint.x - num
	match(point_idx):
		0, 3, 4:
			points.append(Vector2(newPoint_based_way, newPoint.y))
		_:
			points.append(Vector2(newPoint_based_way, newPoint.y))

func randomize_path_points() -> Array:
	var randomized_path_points: Array = []
	
	var num1 = randi() % 50
	var way = randi() % 1
	
	for i in range(path_points.size()):
		var newPoint: Vector2 = path_points[i]
		match_points(randomized_path_points, i, newPoint, num1, way)
	
	return randomized_path_points

# TODO: A implémenter si fonctionnel
#func design_random_corner(points: Array) -> Array:
#	rng.randomize()
#	var new_corner_idx = rng.randi_range(1, 18)
#	var toto: int
#	if new_corner_idx < 9: toto = 1
#	else: toto = 3
#	if toto == 1:
#		var inserted_pos = points[toto]
#		var start_range = rng.randi_range(50, 250)
#		var end_range = rng.randi_range(300, 450)
#		var new_corner = rng.randi_range(50, 200)
#
#		points.insert(toto + 1, Vector2(inserted_pos.x, inserted_pos.y + start_range))
#		points.insert(toto + 2, Vector2(inserted_pos.x - new_corner, inserted_pos.y + start_range))
#		points.insert(toto + 3, Vector2(inserted_pos.x - new_corner, inserted_pos.y + end_range))
#		points.insert(toto + 4, Vector2(inserted_pos.x, inserted_pos.y + end_range))
#
#	return points
