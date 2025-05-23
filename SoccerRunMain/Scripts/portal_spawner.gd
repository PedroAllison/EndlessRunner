extends Node2D

@export var portal_scene: PackedScene
@export var spawn_x_position: float = 800
@export var y_positions := [111, 288]
@export var spawn_interval: float = 10.0

func _ready():
	start_spawn_timer()

func start_spawn_timer():
	var timer = Timer.new()
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.one_shot = false
	timer.timeout.connect(spawn_portal)
	add_child(timer)

func spawn_portal():
	if not portal_scene:
		push_error("portal_scene não está definido.")
		return

	var portal = portal_scene.instantiate()
	
	var y = y_positions[randi() % y_positions.size()]
	portal.global_position = Vector2(spawn_x_position, y)

	get_tree().current_scene.call_deferred("add_child", portal)
