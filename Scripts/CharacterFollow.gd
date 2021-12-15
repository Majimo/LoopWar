extends PathFollow2D

export var character_speed = 100

onready var audio_stream = $AudioStreamPlayer2D

var first_lap = true


#### METHODS ####

func _ready():
	play_walk_sound()

func _process(delta):
	set_offset(get_offset() + character_speed * delta)
	
	# Avoid random first increment of laps
	if get_offset() > 0: first_lap = false
	
	# Detection of a complete lap
	if (get_offset() - character_speed * delta) < 0 && !first_lap:
		EVENTS.emit_signal("lap_finished")

func play_walk_sound():
	audio_stream.play()
	yield(get_tree().create_timer(0.7), "timeout")
	play_walk_sound()
