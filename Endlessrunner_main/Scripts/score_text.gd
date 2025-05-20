extends Label

var dist = 0

func _process(delta: float) -> void:
	
	text = str(dist)
	
	if dist >= 150:
		Global.global_speed = 400
	elif dist >= 100:
		Global.global_speed = 375
	elif dist >= 70:
		Global.global_speed = 350
	elif dist >= 50:
		Global.global_speed = 325
	elif dist >= 20:
		Global.global_speed = 300
	elif dist >= 10:
		Global.global_speed = 275
	pass


func _on_timer_timeout() -> void:
	
	dist += 1
	
	
	pass 
