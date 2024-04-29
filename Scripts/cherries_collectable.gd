extends Area2D

@onready var game_manager = %GameManager
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	animated_sprite.play("default")

func _on_body_entered(body):
	if( body.name == "Player"):
		queue_free()
		game_manager.add_points()
