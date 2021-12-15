extends Control

onready var lap_count = $HBoxContainer/LapCount


#### METHODS ####

func _ready():
	EVENTS.connect("nb_laps_changed", self, "on_EVENTS_nb_laps_changed")


#### SIGNALS ####

func on_EVENTS_nb_laps_changed(nb_laps: int):
	lap_count.set_text(String(nb_laps))
