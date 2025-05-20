extends Node2D

@export var obj: PackedScene
@export var time = 2.0

func _ready() -> void:
	
	$Timer.wait_time = time
	
	pass 


func _on_timer_timeout() -> void:
	
	$Timer.wait_time = randf_range(2.0, 4.0)
	$Timer.start()
	var instance = obj.instantiate()
	instance.global_position = global_position
	get_tree().current_scene.add_child(instance)
	
	
	pass
