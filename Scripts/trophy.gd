extends Area2D

@onready var game_manager = %GameManager
@onready var collect_trophie_audio = $"../CollectTrophieAudio"

func _process(delta):
	var points = game_manager.points
	var total = game_manager.total_cherries
	if(points != total):
		$Sprite2D.modulate = Color(1,1,1,0.5)
		$CollisionShape2D.disabled= true
	else: 
		$Sprite2D.modulate = Color(1,1,1,1)
		$CollisionShape2D.disabled= false

func _on_body_entered(body):
	if (body.name == "Player"):
		#conffetti_animation.play()
		collect_trophie_audio.play()
		queue_free()
		get_tree().change_scene_to_file("res://Scenes/Level_2/level_2.tscn")
