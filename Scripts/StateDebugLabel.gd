extends Label
@export var state_machine : PlayerStateMachine

func _process(delta):
	text = "State: " + state_machine.current_state.name
	
