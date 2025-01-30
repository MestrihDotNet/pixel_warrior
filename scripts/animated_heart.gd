extends Area2D

@export var speed := Vector2(100, -200)  # Initial throw direction
var fall_gravity := 500.0  # Simulated gravity
var is_on_ground := false  # Track if the heart has landed

func _process(delta: float) -> void:
	if not is_on_ground:
		speed.y += fall_gravity * delta  # Apply gravity
		position += speed * delta  # Move the heart

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Monster":  # Adjust name based on your monster node
		print("Monster hit the heart!")
		queue_free()  # Remove heart when the monster touches it
	elif body.is_in_group("ground") and not is_on_ground:
		print("Heart landed on the ground")
		is_on_ground = true
		speed = Vector2.ZERO  # Stop movement when landing
