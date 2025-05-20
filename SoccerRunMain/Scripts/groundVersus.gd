extends Node2D

var next_ground = preload("res://PreFabs/Ground.tscn")
var map_generated = false


func _physics_process(delta: float) -> void:
	
	global_position += Vector2.LEFT * Global.global_speed * delta
	
	
	pass



func _on_area_2d_area_entered(area: Area2D) -> void:
	
	if not map_generated and area.is_in_group("Player"):
		map_generated = true 
		
		var new_ground = next_ground.instantiate()
		new_ground.global_position = Vector2(600 , 0)
		get_tree().current_scene.call_deferred("add_child", new_ground)
		
		await get_tree().create_timer(2).timeout
		queue_free()
		
		pass
	
pass 
