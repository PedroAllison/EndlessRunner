extends Node

var players_alive = 0

func register_player(player):
	players_alive += 1

func player_died():
	players_alive -= 1
	print("Players vivos restantes: ", players_alive)
	
	if players_alive < 2:
		print("Um player morreu. Reiniciando o jogo...")
		await get_tree().create_timer(1.0).timeout
		get_tree().reload_current_scene()
