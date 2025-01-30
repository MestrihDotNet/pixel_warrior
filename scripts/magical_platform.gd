extends Node2D  # MagicalPlatform is a Node2D to allow free movement

@export var speed: float = 200  # Platform movement speed
@export var limit_left: float = 0  # Minimum X position (left boundary)
@export var limit_right: float = 0  # Maximum X position (right boundary)

var movement: float = 0.0  # Horizontal movement speed
var player: Node2D = null  # Reference to the player node

func _ready():
	# Ensure we have a reference to the player node if it exists
	player = get_parent().get_node("player")  # Adjust if player is in a different location

func _physics_process(delta: float) -> void:
	# Get input direction for platform movement
	movement = Input.get_axis("Platform_left", "platform_right") * speed * delta
	position.x += movement  # Move the platform directly along the x-axis

	# Clamp the position to stay within the min and max range
	position.x = clamp(position.x, limit_left, limit_right)

	# If the player exists and is on the platform, move them along with the platform
	if player:
		# Only move the player horizontally if the player is on the platform
		player.position.x += movement
