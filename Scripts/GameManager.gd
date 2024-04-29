extends Node

var points= 0
@onready var points_label = %PointsLabel
@onready var cherrie_icon = $"../UI/Cherrie Icon"

@export var total_cherries = 12

func add_points():
	if points + 1 :
		cherrie_icon.play("default")
		points += 1
		print('olha o pontos ' , points)
		points_label.text =  str(points) + "/"+ str(total_cherries)
