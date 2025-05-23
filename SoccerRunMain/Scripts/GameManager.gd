extends Node

var players_alive = {}  # Ex: {"player1": true, "player2": true}
var winner_player = null

func register_player(player):
	players_alive[player.player_id] = true
	print("Registrado:", player.player_id)

func player_died(player_id):
	if players_alive.has(player_id):
		players_alive[player_id] = false
		print("Morreu:", player_id)
		check_winner()
	else:
		print("Erro: Player não registrado:", player_id)

func check_winner():
	var alive = []
	for id in players_alive.keys():
		if players_alive[id]:
			alive.append(id)

	print("Vivos agora:", alive)

	if alive.size() == 1:
		winner_player = alive[0]
		print("Vencedor:", winner_player)
		get_tree().change_scene_to_file("res://Scenes/Gameover/GameOverVersus.tscn")
	elif alive.size() == 0:
		winner_player = null
		print("Empate!")
		get_tree().change_scene_to_file("res://Scenes/Gameover/GameOverVersus.tscn")
