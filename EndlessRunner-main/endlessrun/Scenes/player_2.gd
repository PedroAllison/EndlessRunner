extends CharacterBody2D


const GRAVITY : int = 3500
const JUMP_SPEED : int = -1100

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if is_on_floor():
		if not get_parent().game_running:
			$AnimatedSprite2D2.play("idle2")
			pass
		else:
			$RunCol2.disabled = false
			if Input.is_action_pressed("ui_accept"):
				velocity.y = JUMP_SPEED
				#$JumpSound.play()
			elif Input.is_action_pressed("ui_down"):
				$AnimatedSprite2D2.play("duck2")
				$RunCol2.disabled = true
			else:
				$AnimatedSprite2D2.play("run2")
	else:
			$AnimatedSprite2D2.play("jump2")
	move_and_slide()
