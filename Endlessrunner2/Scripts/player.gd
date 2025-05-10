extends CharacterBody2D


@export var jump_velocity = -300.0

@export var jump = "Jump"

var dir
var gravity = 980

@onready var animator = $AnimatedSprite2D

var jumps = 1

var is_alive = true

func _ready():
	pass


func _physics_process(delta):
	
	
	Move(delta)
	
	if is_alive:
		Animations()
	
	
	pass

func Move(delta):
	
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
	if is_alive:
		if Input.is_action_just_pressed(jump) and jumps > 0:
			velocity.y = jump_velocity
			if jumps > 0:
				jumps -= 1
	
	
	if is_on_floor():
		jumps = 1
	
	move_and_slide()
	
	pass


func Animations():
	
	if is_on_floor():
		animator.play("Run")
	
	if not is_on_floor() and jumps >= 1:
		animator.play("Jump")
	
	
	pass


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
	
	pass
