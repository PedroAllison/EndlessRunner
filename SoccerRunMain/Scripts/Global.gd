extends Node

var global_speed = 200
var score: int = 0

func add_score(value: int) -> void:
	score += value
	update_score_display()

func update_score_display() -> void:
	var main = get_tree().get_root().get_node("Main/score")
	var label = main.get_node("ScoreLabel")
	label.text = "%d" % score

func reset_score() -> void:
	score = 0
	update_score_display()
