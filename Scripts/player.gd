extends CharacterBody2D


@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_tree:AnimationTree = $AnimationTree
@onready var state_machine:PlayerStateMachine = $PlayerStateMachine
@onready var coyote_timer: Timer = $CoyoteTimer
@onready var animation_player : AnimationPlayer = $AnimationPlayer

@export var speed :float = 300.0
@export var deceleration : float = 15

var direction :Vector2 = Vector2.ZERO
var has_doubled_jumped:bool = false;
var animation_lock:bool = false;
var was_in_air : bool = false

var jump_cut: bool = false

func _ready():
	pass
	

func _physics_process(delta):	
	direction = Input.get_vector("left","right","crouch","")
	if direction.x != 0 && state_machine.check_if_can_move():
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, deceleration)
		
	var was_on_floor = is_on_floor()
	
	
	move_and_slide()
	update_animation()
	update_facing_direction()
	
	if was_on_floor && !is_on_floor():
		coyote_timer.start()


func update_animation():
	if velocity.x > 0 and is_on_floor():
		animation_player.play("run")
	elif velocity.x < 0 and is_on_floor():
		animation_player.play("run")
	elif velocity.y < 0:
		animation_player.play("jump")
	elif velocity.y > 0:
		animation_player.play("landing")
	else: 
		animation_player.play("idle")
		
func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h =false
	elif direction.x < 0:
		sprite.flip_h =true

func _process(delta):
	pass

func _input(event : InputEvent):
	# move o player para baixo se ele estiver em cima de uma plataforma atravessavel
	if event.is_action_pressed("crouch") and is_on_floor():
		position.y += 1
	
	
