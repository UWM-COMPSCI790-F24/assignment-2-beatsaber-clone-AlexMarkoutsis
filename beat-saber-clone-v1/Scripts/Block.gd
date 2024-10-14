extends Node3D

var speed = 3.0
var distance = 12.0
var start_pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_pos = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.z += speed * delta
	if (global_position.z - start_pos.z) > distance:
		queue_free()


func _on_area_3d_area_entered(area: Area3D) -> void:
	$AudioStreamPlayer.play()
	if area.get_parent_node_3d().name == "LineRenderer":
		queue_free()
