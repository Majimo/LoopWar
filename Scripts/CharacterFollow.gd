extends PathFollow2D

export var character_speed = 100


func _process(delta):
	set_offset(get_offset() + character_speed * delta)
