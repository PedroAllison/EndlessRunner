extends Control


func _on_play_pressed() -> void:
	
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
	
	pass 



func _on_exit_pressed() -> void:
	
	get_tree().quit()
	
	pass 
