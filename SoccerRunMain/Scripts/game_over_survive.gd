extends Control

@onready var time_label = $Panel/TimeLabel
@onready var coins_label = $Panel/CoinsLabel
@onready var retry_button = $Panel/RetryButton
@onready var menu_button = $Panel/MenuButton

func _ready():
	visible = false
	retry_button.pressed.connect(_on_retry_pressed)
	menu_button.pressed.connect(_on_menu_pressed)

func show_game_over(time_survived: float, coins_collected: int):
	visible = true
	get_tree().paused = true

	var minutes = int(time_survived) / 60
	var seconds = int(time_survived) % 60

	time_label.text = "Tempo: %dm %ds" % [minutes, seconds]
	coins_label.text = "Moedas: %d" % coins_collected

func _on_retry_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
