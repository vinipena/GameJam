extends State
class_name	DeadState

@export var dead_animation_name: String = "dead"
@export var reset_state:State

func _physics_process(delta):
	can_move = false
