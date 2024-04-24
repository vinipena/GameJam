extends State
class_name AirState

@export var state_machine: PlayerStateMachine
@export var landing_state: State
@export var ground_state: State
@export var double_jump_velocity:float = -200.0
@onready var jump_sound = $"../../JumpSound"

var has_doubled_jumped = false

func _physics_process(delta):
	pass
	
func state_process(delta):
	if !character.is_on_floor() and character.velocity.y > 0:
		print("SABUGANDO")
		next_state = landing_state


func state_input(event:InputEvent):
	if(event.is_action_pressed("jump") && !has_doubled_jumped):
		character.animation_player.play("double_jump")
		double_jump()


func double_jump():
	character.velocity.y = double_jump_velocity
	has_doubled_jumped = true
	jump_sound.play()
	

func on_enter():
	print("estado atual air enter: " , state_machine.current_state)

func on_exit():
	next_state = landing_state
	has_doubled_jumped = false
	#if next_state == landing_state:
		#character.animation_player.play("landing")
		#print("estado atual air exit : " , state_machine.current_state)
		#has_doubled_jumped = false

