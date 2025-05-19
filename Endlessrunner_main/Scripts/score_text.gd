extends Label

var dist = 0

func _process(delta: float) -> void:
	
	text = str(dist)
	
	if dist >= 150:
		Global.global_speed = 650
	elif dist >= 100:
		Global.global_speed = 600
	elif dist >= 70:
		Global.global_speed = 500
	elif dist >= 50:
		Global.global_speed = 400
	elif dist >= 20:
		Global.global_speed = 300
	elif dist >= 10:
		Global.global_speed = 100
	pass


func _on_timer_timeout() -> void:
	
	dist += 1
	
	
	pass 
