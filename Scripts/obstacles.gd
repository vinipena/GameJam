extends Area2D

@onready var timer = $Timer
@onready var audio_stream_player = $AudioStreamPlayer

func _on_body_entered(body):
	if body.name == "Player":
		audio_stream_player.play()
		audio_stream_player.play()
		Engine.time_scale = 0.5
		body.get_node("CollisionShape2D").queue_free()
		print("morreu")
		timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
