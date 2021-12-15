extends PathFollow2D

export var character_speed = 300

var first_lap = true


#### METHODS ####

func _process(delta):
	set_offset(get_offset() + character_speed * delta)
	
	# Avoid random first increment of laps
	if get_offset() > 0: first_lap = false
	
	# Detection of a complete lap
	if (get_offset() - character_speed * delta) < 0 && !first_lap:
		EVENTS.emit_signal("lap_finished")
