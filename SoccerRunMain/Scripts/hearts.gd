extends CanvasLayer

@export var player: CharacterBody2D
@onready var hearts = $Hearts.get_children()

func _process(_delta):
	update_hearts()

func update_hearts():
	for i in range(hearts.size()):
		hearts[i].visible = i < player.lives
