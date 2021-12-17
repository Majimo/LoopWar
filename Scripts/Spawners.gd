extends Node2D
class_name Spawner


enum STATE {
	INACTIVE,
	IDLE,
	ACTIVE
}
var state: int = STATE.INACTIVE


#### METHODS ####

func activate():
	state = STATE.ACTIVE

func idle_node(node: Node2D):
	if GAME.get_nb_laps() > 0:
		node.set_visible(true)
		state = STATE.IDLE

#### SIGNALS ####

func _on_Area2D_body_entered(_body):
	if state == STATE.INACTIVE:
		return
	if state == STATE.IDLE:
		activate()
