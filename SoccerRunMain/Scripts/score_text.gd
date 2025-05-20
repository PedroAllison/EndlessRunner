extends Label

var dist = 0

func _process(delta: float) -> void:
	var minutos = dist / 60
	var segundos = dist % 60

	text = str(minutos).pad_zeros(2) + ":" + str(segundos).pad_zeros(2)
	
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


func _on_timer_timeout() -> void:
	dist += 1
