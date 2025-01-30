extends Area2D

# Detect ground collision
func _on_body_entered(body: Node2D) -> void:
	queue_free()
