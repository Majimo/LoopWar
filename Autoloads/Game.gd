extends Node

var nb_laps: int = 0 setget set_nb_laps, get_nb_laps


#### ACCESSORS ####

func set_nb_laps(value: int):
	if value != nb_laps:
		nb_laps = value
		EVENTS.emit_signal("nb_laps_changed", nb_laps)
func get_nb_laps() -> int: return nb_laps


#### METHODS ####

func _ready():
	EVENTS.connect("lap_finished", self, "on_EVENTS_lap_finished")


#### SIGNALS ####

func on_EVENTS_lap_finished():
	set_nb_laps(nb_laps + 1)
