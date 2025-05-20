extends Area2D

var has_swapped := false
var players := []

func _ready():
	players = get_tree().get_nodes_in_group("players")
	if players.size() != 2:
		push_error("Esperado exatamente 2 jogadores no grupo 'players'.")
		return
	

func _physics_process(delta: float) -> void:
	global_position += Vector2.LEFT * Global.global_speed * delta

func _on_body_entered(body):
	var player_node = body
	while player_node and not player_node.is_in_group("players"):
		player_node = player_node.get_parent()

	if not player_node:
		return 

	if has_swapped:
		return

	var p1 = players[0]
	var p2 = players[1]

	var x1 = p1.global_position.x
	var x2 = p2.global_position.x

	var temp_y = p1.global_position.y
	p1.global_position = Vector2(x1, p2.global_position.y)
	p2.global_position = Vector2(x2, temp_y)

	has_swapped = true
