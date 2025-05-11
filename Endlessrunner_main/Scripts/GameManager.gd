extends Node

var alive_players = 0

func register_player():
	alive_players += 1

func player_died():
	alive_players -= 1
	if alive_players <= 0:
		print("Todos os jogadores morreram. Reiniciando...")
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene()
