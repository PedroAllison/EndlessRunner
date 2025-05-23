extends Node

var global_speed = 200
var score: int = 0
var final_score: int = 0

func add_score(value: int) -> void:
	score += value
	update_score_display()

func update_score_display() -> void:
	var root = get_tree().get_root()
	if root == null:
		return
	
	var label = root.get_node_or_null("Main/score/CoinsLabel")
	
	if label:
		label.text = "%d" % score
	else:
		print("CoinsLabel não encontrado em Main/score/CoinsLabel")

func reset_score() -> void:
	score = 0
	final_score = 0
	update_score_display()
