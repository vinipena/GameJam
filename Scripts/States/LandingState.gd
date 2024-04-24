extends State
class_name LandingState

@export var ground_state: State
@export var air_state: State


	
func _physics_process(delta):
	if character.velocity.y > 0 and !character.is_on_floor():
		next_state = self
	elif character.is_on_floor():
		next_state = ground_state

func state_input(event:InputEvent):
	if(event.is_action_pressed("jump") && !air_state.has_doubled_jumped):
		character.animation_player.play("double_jump")
		air_state.double_jump()
