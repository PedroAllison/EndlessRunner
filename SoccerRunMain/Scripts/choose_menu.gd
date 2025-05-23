extends Control

@onready var versus_button = $Menu/Versus
@onready var survive_button = $Menu/Survive
@onready var back_button = $Menu/Back
@onready var selector = $Selector

var buttons = []
var current_index = 0
var input_cooldown = 0.2
var cooldown_timer = 0.0

func _ready():
	buttons = [versus_button, survive_button, back_button]
	for button in buttons:
		button.connect("focus_entered", Callable(self, "_on_button_focus"))
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
			buttons[current_index].emit_signal("pressed")
			cooldown_timer = input_cooldown

func _on_button_focus():
	var focused_button = get_viewport().gui_get_focus_owner()
	if focused_button == null:
		return
	current_index = buttons.find(focused_button)
	update_selector_position()

func update_selector_position():
	var focused_button = get_viewport().gui_get_focus_owner()
	if focused_button == null:
		return
	var rect = focused_button.get_global_rect()

	if focused_button == back_button:
		selector.global_position = rect.position + Vector2(130, rect.size.y / 2)
	elif focused_button == versus_button:
		selector.global_position = rect.position + Vector2(220, rect.size.y / 2)
	else:
		selector.global_position = rect.position + Vector2(240, rect.size.y / 2)

func _on_versus_pressed():
	get_tree().change_scene_to_file("res://Scenes/Versus.tscn")

func _on_survive_pressed():
	get_tree().change_scene_to_file("res://Scenes/Survive.tscn")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
