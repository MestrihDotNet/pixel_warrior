extends StaticBody2D

@export var speed: float = 200  # Platform movement speed
var player: CharacterBody2D = null  # To track the character standing on the platform

func _process(delta):
	var direction = Input.get_axis("Platform_left", "platform_right")
	var movement = direction * speed * delta
	position.x += movement

	# Move the character along with the platform
	if player:
		player.position.x += movement  # Move the character with the platform

# Detect when character steps on the platform
func _on_body_entered(body):
	if body is CharacterBody2D:
		player = body  # Store reference to character

# Detect when character leaves the platform
func _on_body_exited(body):
	if body == player:
		player = null  # Remove reference when character jumps off
