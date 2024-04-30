extends Line2D
class_name Trails

var queue : Array
@export var max_length : int 


func _process(delta):
	var position = _get_position()
	
	queue.push_front(position)
	
	if queue.size() > max_length:
		queue.pop_back().normalized()
		
	clear_points()
	
	for point in queue:
		add_point(point)


func _get_position():
	return get_global_mouse_position()
