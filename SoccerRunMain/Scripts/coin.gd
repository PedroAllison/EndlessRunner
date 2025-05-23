extends Area2D

@export var score_value: int = 1

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	global_position += Vector2.LEFT * Global.global_speed * delta
	pass

func _on_body_entered(body):
	if body.is_in_group("players"):
		Global.add_score(1)
		queue_free()
