extends Node2D

onready var audio_stream = $AudioStreamPlayer2D
onready var gold_mine = $"."
onready var particles = $Particles2D

enum STATE {
	INACTIVE,
	IDLE,
	COLLECT
}
var state: int = STATE.INACTIVE


#### METHODS ####

func _ready():
	var _path_changed = EVENTS.connect("path_points_changed", self, "on_EVENTS_path_points_changed")
	gold_mine.set_visible(false)

func _process(_delta):
	if GAME.get_nb_laps() > 0:
		gold_mine.set_visible(true)
		state = STATE.IDLE

func collect():
	state = STATE.COLLECT
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

func _on_Area2D_body_entered(_body):
	if state == STATE.INACTIVE:
		return
	if state == STATE.IDLE:
		collect()
