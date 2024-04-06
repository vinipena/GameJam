extends State
class_name GroundState

@export var  jump_velocity :float= -400.0
@export var air_state:State
@export var dead_state:State
@export var reset_state:State
@export var jump_animation:String = "jump_start"
@export var dead_animation:String = "dead_animation"

func state_input(event:InputEvent):
	if(event.is_action_pressed("jump")):
		jump();
	
func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)
	
func death():
	playback.travel(dead_animation)
	next_state = reset_state
