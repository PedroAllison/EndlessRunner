extends Node2D

@export var obj: PackedScene
@export var time = 1.0

func _ready() -> void:
	
	$Timer.wait_time = time
	
	pass 


func _on_timer_timeout() -> void:
	
	$Timer.wait_time = randf_range(1.0, 3.0)
	$Timer.start()
	var instance = obj.instantiate()
	instance.global_position = global_position
	get_tree().current_scene.add_child(instance)
	
	
	pass
