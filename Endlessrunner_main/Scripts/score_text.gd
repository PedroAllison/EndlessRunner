extends Label

var dist = 0

func _process(delta: float) -> void:
	
	text = str(dist)
	
	
	
	
	
	if dist >= 20:
		Global.global_speed = 4000
	elif dist >= 10:
		Global.global_speed = 350
	
	pass


func _on_timer_timeout() -> void:
	
	dist += 1
	
	
	pass 
