extends CharacterBody2D


const SPEED = 180.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left","ui_right")
	if direction > 0:
		velocity.x = direction * SPEED
		$FlipPlayer_node2d/AnimatedSprite2D.flip_h = false
		$FlipPlayer_node2d/AnimatedSprite2D.play("running")
	elif direction < 0:
		$FlipPlayer_node2d/AnimatedSprite2D.flip_h = true
		velocity.x = direction * SPEED
		$FlipPlayer_node2d/AnimatedSprite2D.play("running")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$FlipPlayer_node2d/AnimatedSprite2D.play("idle")

	move_and_slide()
