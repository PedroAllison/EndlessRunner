extends Control

func _on_versus_pressed():
	get_tree().change_scene_to_file("res://Scenes/Versus.tscn")
	pass # Replace with function body.

func _on_survive_pressed():
	get_tree().change_scene_to_file("res://Scenes/Survive.tscn")
	pass # Replace with function body.

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	pass # Replace with function body.
