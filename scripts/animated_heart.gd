extends Area2D

var velocity = Vector2(0, 0)  # Movement vector
var custom_gravity = 500  # Gravity strength
var on_floor = false  # Check if heart has landed

@onready var raycast = $RayCast2D  # Reference to the RayCast2D node

func _process(delta):
	if not on_floor:
		velocity.y += custom_gravity * delta  # Apply gravity
		position += velocity * delta  # Move downward

	# If the RayCast2D detects the floor, stop movement
	if raycast.is_colliding():
		velocity.y = 0
		on_floor = true
		
		# Adjust the heart’s position slightly above the ground
		var ground_y = raycast.get_collision_point().y
		position.y = ground_y - 5  # Adjust this value to prevent sinking
	else:
		on_floor = false  # If no collision, heart is still falling

func _on_body_entered(body: Node2D) -> void:
	# Debug: Print the name and groups of the body
	print("Body entered: ", body.name)
	print("Groups: ", body.get_groups())

	if body.is_in_group("player"):
		print("Collision with player!")
	elif body.is_in_group("enemy"):
		print("enemy")
