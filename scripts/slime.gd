extends Area2D

const slimeSpeed = 30
var slimeDircetion := 1

@onready var ray_cast_r: RayCast2D = $RayCast_R
@onready var ray_cast_l: RayCast2D = $RayCast_L


func _process(delta: float) -> void:
	if ray_cast_r.is_colliding():
		slimeDircetion = -1
	elif ray_cast_l.is_colliding():
		slimeDircetion = 1
		
	position.x += slimeDircetion * slimeSpeed * delta
