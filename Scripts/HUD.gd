extends Control

onready var lap_count = $VBoxContainer/HBoxContainer/LapCount
onready var gold_count = $VBoxContainer/HBoxContainer2/GoldCount


#### METHODS ####

func _ready():
	EVENTS.connect("nb_laps_changed", self, "on_EVENTS_nb_laps_changed")
	EVENTS.connect("nb_gold_changed", self, "on_EVENTS_nb_gold_changed")


#### SIGNALS ####

func on_EVENTS_nb_laps_changed(nb_laps: int):
	lap_count.set_text(String(nb_laps))

func on_EVENTS_nb_gold_changed(nb_gold: int):
	gold_count.set_text(String(nb_gold))
