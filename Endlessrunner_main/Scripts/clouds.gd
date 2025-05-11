extends Node2D


func _ready() -> void:
	
	pass


func _physics_process(delta: float) -> void:
	
	global_position += Vector2.LEFT * Global.global_speed * delta
	
	pass
