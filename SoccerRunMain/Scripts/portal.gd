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

	if not player_node or has_swapped:
		return

	var p1 = players[0]
	var p2 = players[1]

	var y1 = p1.global_position.y
	var y2 = p2.global_position.y

	p1.global_position.y = y2
	p2.global_position.y = y1	

	has_swapped = true
