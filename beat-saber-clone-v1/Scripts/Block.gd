extends Node3D

var speed = 4.5
var distance = 15.0
var start_pos

var min_x = -1.0
var max_x = 1.0
var min_y = 0.3
var max_y = 1.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_pos = global_position
	
	global_position.x = randf_range(min_x, max_x)
	global_position.y = randf_range(min_y, max_y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.z += speed * delta
	if (global_position.z - start_pos.z) > distance:
		queue_free()
