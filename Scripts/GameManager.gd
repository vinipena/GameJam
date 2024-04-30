extends Node

var points= 0
@onready var points_label = %PointsLabel
@onready var cherrie_icon = $"../UI/Cherrie Icon"
@onready var collect_cherrie_audio = $"../CollectCherrieAudio"

@export var total_cherries = 10

func add_points():
	if points + 1 :
		cherrie_icon.play("default")
		points += 1
		collect_cherrie_audio.play()
		print('olha o pontos ' , points)
		points_label.text =  str(points) + "/"+ str(total_cherries)
