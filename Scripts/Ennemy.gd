extends Spawner

onready var enemy = $"."

enum DIRECTION {
	UP,
	RIGHT,
	DOWN,
	LEFT
}

#### METHODS ####

func _ready():
	var _path_changed = EVENTS.connect("path_points_changed", self, "on_EVENTS_path_points_changed")
	enemy.set_visible(false)

func _process(_delta):
	.idle_node(enemy)

func activate():
	.activate()
	print("Baston !!!")
	state = STATE.IDLE

func find_direction(max_point: Vector2, min_point: Vector2):
	var delta_rng: int = 0
	if max_point.y == min_point.y && max_point.x < min_point.x:
		delta_rng = randi() % (int(min_point.x) - int(max_point.x))
		enemy.set_position(Vector2(min_point.x - delta_rng, min_point.y))
	if max_point.x == min_point.x && max_point.y < min_point.y:
		delta_rng = randi() % (int(min_point.y) - int(max_point.y))
		enemy.set_position(Vector2(min_point.x, min_point.y + delta_rng))
	if max_point.y == min_point.y && max_point.x > min_point.x:
		delta_rng = randi() % (int(max_point.x) - int(min_point.x))
		enemy.set_position(Vector2(max_point.x - delta_rng, max_point.y))
	if max_point.x == min_point.x && max_point.y > min_point.y:
		delta_rng = randi() % (int(max_point.y) - int(min_point.y))
		enemy.set_position(Vector2(max_point.x - delta_rng, max_point.y))


#### SIGNALS ####

func on_EVENTS_path_points_changed(points: Array):
	if points.size() > 1:
		var point_idx = randi() % points.size() - 1
		if point_idx < 0:
			point_idx = randi() % points.size() - 1
		var max_point: Vector2 = points[point_idx + 1]
		var min_point: Vector2 = points[point_idx]
		find_direction(max_point, min_point)
