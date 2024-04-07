extends Node

var points= 0
@onready var points_label = %PointsLabel
@export var total_cherries = 12
func add_points():
	points += 1
	print(points)
	points_label.text = "Total cherries!: " + str(points) + "/"+ str(total_cherries)
