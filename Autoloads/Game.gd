extends Node

var nb_laps: int = 0 setget set_nb_laps, get_nb_laps
var nb_gold: int = 0 setget set_nb_gold, get_nb_gold


#### ACCESSORS ####

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
	EVENTS.connect("lap_finished", self, "on_EVENTS_lap_finished")
	EVENTS.connect("gold_collected", self, "on_EVENTS_gold_collected")


#### SIGNALS ####

func on_EVENTS_lap_finished():
	set_nb_laps(nb_laps + 1)

func on_EVENTS_gold_collected():
	set_nb_gold(nb_gold + 10)
