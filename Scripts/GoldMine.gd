extends Node2D

onready var particles = $Particles2D
onready var audio_stream = $AudioStreamPlayer2D

enum STATE {
	IDLE,
	COLLECT
}

var state: int = STATE.IDLE


func collect():
	state = STATE.COLLECT
	particles.set_emitting(true)
	audio_stream.play()
	EVENTS.emit_signal("gold_collected")
	state = STATE.IDLE


func _on_Area2D_body_entered(body):
	if state == STATE.IDLE:
		collect()
