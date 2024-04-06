extends State
class_name	DeadState

@export var dead_animation_name: String = "dead"
@export var reset_state:State

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == dead_animation_name):
		next_state = reset_state
