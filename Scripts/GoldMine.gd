extends Spawner

onready var audio_stream = $AudioStreamPlayer2D
onready var gold_mine = $"."
onready var particles = $Particles2D


#### METHODS ####

func _ready():
	var _path_changed = EVENTS.connect("path_points_changed", self, "on_EVENTS_path_points_changed")
	gold_mine.set_visible(false)

func _process(_delta):
	.idle_node(gold_mine)

func activate():
	.activate()
	particles.set_emitting(true)
	audio_stream.play()
	var granularity = int(GAME.get_nb_laps() / 5.0) + 1
	EVENTS.emit_signal("gold_collected", 10 * granularity)
	state = STATE.IDLE


#### SIGNALS ####

func on_EVENTS_path_points_changed(points: Array):
	var path_points = points
	var delta_rng: int = 0
	if path_points.size() > 1: 
		var max_point: int = path_points[1].x
		var min_point: int = path_points[0].x
		delta_rng = randi() % (max_point - min_point)
		gold_mine.set_position(Vector2(path_points[0].x + delta_rng, path_points[0].y - 32))
