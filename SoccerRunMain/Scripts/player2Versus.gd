extends CharacterBody2D

@export var jump_velocity = -300.0
@export var jump = "Jump"
@export var max_lives = 3
@export var invincibility_time = 5.0
@export var player_id := "player1"


var lives = max_lives
var gravity = 980
var jumps = 1
var is_alive = true
var was_on_floor = false
var invincible = false

@onready var animator = $AnimatedSprite2D

func _ready():
	add_to_group("players")
	if is_alive:
		GameManager.register_player(self)

func _physics_process(delta):
	if is_alive:
		Move(delta)
		Animations()

func Move(delta):
	velocity.x = 0  

	if not is_on_floor():
		velocity.y += gravity * delta

	if is_alive and Input.is_action_just_pressed(jump) and jumps > 0:
		velocity.y = jump_velocity
		jumps -= 1

	if is_on_floor() and not was_on_floor:
		jumps = 1

	was_on_floor = is_on_floor()

	move_and_slide()

func Animations():
	if is_on_floor():
		animator.play("Run")
	else:
		animator.play("Jump")

func die():
	if not is_alive or invincible:
		return

	lives -= 1
	print("Player perdeu uma vida, vidas restantes: ", lives)

	if lives > 0:
		invincible = true
		start_invincibility()
		return

	is_alive = false
	animator.play("Hit")
	$CollisionShape2D.queue_free()
	$Area2D.queue_free()
	velocity.y = jump_velocity
	Engine.time_scale = 0.5
	await get_tree().create_timer(0.8).timeout
	Engine.time_scale = 1
	emit_signal("died")

	GameManager.player_died()


func start_invincibility():

	var blink_timer = Timer.new()
	blink_timer.wait_time = 0.2
	blink_timer.one_shot = false
	blink_timer.autostart = true
	add_child(blink_timer)
	blink_timer.connect("timeout", Callable(self, "_on_blink_timeout"))

	
	var inv_timer = Timer.new()
	inv_timer.wait_time = invincibility_time
	inv_timer.one_shot = true
	inv_timer.autostart = true
	add_child(inv_timer)
	inv_timer.connect("timeout", Callable(self, "_on_invincibility_timeout"))

func _on_blink_timeout():

	animator.visible = !animator.visible

func _on_invincibility_timeout():
	invincible = false
	animator.visible = true

	for child in get_children():
		if child is Timer:
			child.queue_free()
