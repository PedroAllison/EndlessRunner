extends Control

@onready var retry_button = $RetryButton
@onready var menu_button = $MenuButton
@onready var winner_label = $Winner
@onready var selector = $Selector

var buttons = []
var current_index = 0
var input_cooldown = 0.2
var cooldown_timer = 0.0

func _ready():
	if GameManager.winner_player != null:
		winner_label.text = "%s venceu!" % GameManager.winner_player.capitalize()
	else:
		winner_label.text = "Empate!"
		
	buttons = [retry_button, menu_button]
	for button in buttons:
		button.connect("focus_entered", Callable(self, "_on_button_focus"))
		button.connect("pressed", Callable(self, "_on_button_pressed"))

	buttons[current_index].grab_focus()
	update_selector_position()

func _process(delta):
	if cooldown_timer > 0:
		cooldown_timer -= delta

func _unhandled_input(event):
	if cooldown_timer <= 0:
		if event.is_action_pressed("ui_down"):
			current_index = (current_index + 1) % buttons.size()
			buttons[current_index].grab_focus()
			cooldown_timer = input_cooldown
		elif event.is_action_pressed("ui_up"):
			current_index = (current_index - 1 + buttons.size()) % buttons.size()
			buttons[current_index].grab_focus()
			cooldown_timer = input_cooldown
		elif event.is_action_pressed("ui_accept"):
			_on_button_pressed()
			cooldown_timer = input_cooldown

func _on_button_focus():
	update_selector_position()

func update_selector_position():
	var focused_button = get_viewport().gui_get_focus_owner()
	if focused_button:
		var rect = focused_button.get_global_rect()
		selector.global_position = rect.position + Vector2(244, rect.size.y / 2)

func _on_button_pressed():
	var focused_button = get_viewport().gui_get_focus_owner()
	if focused_button == retry_button:
		_on_retry_button_pressed()
	elif focused_button == menu_button:
		_on_menu_button_pressed()

func _on_retry_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Versus.tscn")

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/chooseMenu.tscn")
