extends State
class_name GroundState

@export var air_state:State
@export var dead_state:State
@onready var jump_sound = $"../../JumpSound"

#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var jump_height : float
@export var jump_time_to_peak : float 
@export var jump_time_to_descent: float  

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * - 1.0
@onready var jump_gravity  : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
@onready var fall_gravity  : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0


func _physics_process(delta):
	if !character.is_on_floor():
		# Aplica gravidade se o personagem não está no chão
		#character.velocity.y += gravity * delta
		character.velocity.y += get_gravity() * delta
		
	if !character.is_on_floor() and !character.coyote_timer.is_stopped():
		next_state = air_state 

	if Input.is_action_just_released("jump"): # air_state and character.velocity.y < 0:
		cut_jump()
		

func get_gravity() -> float:
	return jump_gravity if character.velocity.y < 0.0 else fall_gravity

func state_input(event:InputEvent):
	if(event.is_action_pressed("jump") and character.is_on_floor() || event.is_action_pressed("jump") and !character.coyote_timer.is_stopped()):
			jump();

func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	jump_sound.play()
#
func cut_jump():
	# Reduz a velocidade de subida imediatamente ao soltar o botão
	#character.velocity.y /= 2
	pass
