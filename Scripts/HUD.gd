extends Control

onready var lap_count = $VBoxContainer/HBoxContainer/LapCount
onready var gold_count = $VBoxContainer/HBoxContainer2/GoldCount
onready var pause = $SpeedBoxContainer/PauseButton
onready var speed1 = $SpeedBoxContainer/Speed1Button
onready var speed2 = $SpeedBoxContainer/Speed2Button
onready var speed4 = $SpeedBoxContainer/Speed4Button


#### METHODS ####

func _ready():
	var _laps = EVENTS.connect("nb_laps_changed", self, "on_EVENTS_nb_laps_changed")
	var _gold = EVENTS.connect("nb_gold_changed", self, "on_EVENTS_nb_gold_changed")


#### SIGNALS ####

func on_EVENTS_nb_laps_changed(nb_laps: int):
	lap_count.set_text(String(nb_laps))

func on_EVENTS_nb_gold_changed(nb_gold: int):
	gold_count.set_text(String(nb_gold))

func _on_PauseButton_pressed():
	EVENTS.emit_signal("player_speed_changed", 0)

func _on_Speed1Button_pressed():
	EVENTS.emit_signal("player_speed_changed", 1)

func _on_Speed2Button_pressed():
	EVENTS.emit_signal("player_speed_changed", 2)

func _on_Speed4Button_pressed():
	EVENTS.emit_signal("player_speed_changed", 4)
