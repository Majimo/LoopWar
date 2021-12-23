extends Node

#### COLORS ####
var purple = '#2b0f54'
var dark_pink = '#ab1f65'
var pink = '#ff4f69'
var white = '#fff7f8'
var orange = '#ff8142'
var yellow = '#ffda45'
var dark_blue = '#3368dc'
var blue = '#49e7ec'

var actual_path_points: Array = [] setget set_actual_path_points, get_actual_path_points
var player_walk_speed = 200 setget set_player_walk_speed, get_player_walk_speed
var nb_laps: int = 0 setget set_nb_laps, get_nb_laps
var nb_gold: int = 0 setget set_nb_gold, get_nb_gold


#### ACCESSORS ####

func set_actual_path_points(value: Array):
	if value != actual_path_points:
		actual_path_points = value
func get_actual_path_points() -> Array: return actual_path_points

func set_player_walk_speed(value: int):
	if value != player_walk_speed:
		player_walk_speed = value * 200
func get_player_walk_speed() -> int: return player_walk_speed

func set_nb_laps(value: int):
	if value != nb_laps:
		nb_laps = value
		EVENTS.emit_signal("nb_laps_changed", nb_laps)
func get_nb_laps() -> int: return nb_laps

func set_nb_gold(value: int):
	if value != nb_gold:
		nb_gold = value
		EVENTS.emit_signal("nb_gold_changed", nb_gold)
func get_nb_gold() -> int: return nb_gold


#### METHODS ####

func _ready():
	randomize()
	var _gold = EVENTS.connect("gold_collected", self, "on_EVENTS_gold_collected")
	var _lap = EVENTS.connect("lap_finished", self, "on_EVENTS_lap_finished")
	var _path = EVENTS.connect("path_points_changed", self, "on_EVENTS_path_points_changed")
	var _speed = EVENTS.connect("player_speed_changed", self, "on_EVENTS_player_speed_changed")


#### SIGNALS ####

func on_EVENTS_path_points_changed(points: Array):
	set_actual_path_points(points)

func on_EVENTS_player_speed_changed(speed: int):
	set_player_walk_speed(speed)

func on_EVENTS_lap_finished():
	set_nb_laps(nb_laps + 1)

func on_EVENTS_gold_collected(gold: int):
	set_nb_gold(nb_gold + gold)
