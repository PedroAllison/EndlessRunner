extends Area2D


func _ready() -> void:
	
	pass


func _physics_process(delta: float) -> void:
	
	global_position += Vector2.LEFT * Global.global_speed * delta
	
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		area.get_parent().die()
	
	pass 
