extends CharacterBody2D

@export var jump_velocity = -300.0
@export var jump = "Jump"

var gravity = 980
var jumps = 1
var is_alive = true
var was_on_floor = false

@onready var animator = $AnimatedSprite2D

func _physics_process(delta):
	if is_alive:
		Move(delta)
		Animations()

func Move(delta):
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
	is_alive = false
	animator.play("Hit")
	$CollisionShape2D.queue_free()
	$Area2D.queue_free()
	velocity.y = jump_velocity
	Engine.time_scale = 0.5
	await get_tree().create_timer(0.8).timeout
	Engine.time_scale = 1
	get_tree().reload_current_scene()
