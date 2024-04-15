extends State
class_name AirState

@export var landing_state: State
@export var double_jump_velocity:float = -200.0
@export var double_jump_animation:String = "jump_double"
@export var landing_animation:String = "jump_end"
@onready var jump_sound = $"../../JumpSound"

var has_doubled_jumped = false

func state_proceess(delta):
	if (character.is_on_floor()):
		next_state= landing_state
		
func state_input(event:InputEvent):
	if(event.is_action_pressed("jump") && !has_doubled_jumped):
		double_jump()
	
func double_jump():
	character.velocity.y = double_jump_velocity
	has_doubled_jumped = true
	playback.travel(double_jump_animation)
	jump_sound.play()

func on_exit():
	if(next_state == landing_state):
		playback.travel(landing_animation)
		has_doubled_jumped = false
