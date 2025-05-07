extends Area2D

var speed := 100  # valor padrão

func _process(delta):
	position.x -= speed * delta
