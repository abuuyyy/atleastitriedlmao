extends CharacterBody2D


const walk = 200.0
const sprint = 350.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	var direction := Input.get_axis("ui_left", "ui_right")
	var current_speed : float = walk
	var shift := Input.is_action_pressed("Shift")
	if shift:
		current_speed = sprint

	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")
	elif is_on_floor():
		if direction == 0:
			$AnimatedSprite2D.play("default")
		elif direction and shift:
			$AnimatedSprite2D.play("run")
		else:
			$AnimatedSprite2D.play("walk")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if direction:
		velocity.x = direction * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
	
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
	elif direction < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		pass

	move_and_slide()
