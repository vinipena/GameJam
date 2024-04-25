extends Node

class_name PlayerStateMachine
@export var current_state :State
@export var player :CharacterBody2D
var states:Array[State]

@onready var animation_player : AnimationPlayer = $"../AnimationPlayer"



func _ready():
	for child in get_children():
		if (child is State):
			states.append(child)
			#Adiciona o necessario para que os estados funcionem corretamente
			child.character = player
		else:
			push_warning("Child " + child.name + " is not a State for PlayerStateMachine")

func _physics_process(delta):
	if (current_state.next_state != null):
		switch_state(current_state.next_state)
	
	current_state.state_process(delta)
func check_if_can_move():
	return current_state.can_move

func switch_state(new_state:State):
	if(current_state !=null):
		current_state.on_exit()
		current_state.next_state = null
	current_state = new_state
	current_state.on_enter()

func _input(event:InputEvent):
	current_state.state_input(event)
