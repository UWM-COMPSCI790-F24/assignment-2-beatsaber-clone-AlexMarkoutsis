extends XRController3D

var toggled = true
var active_collider = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"RayCast3D".set_collision_mask_value(1, $"LineRenderer".get_layer_mask_value(1))
	$"RayCast3D".set_collision_mask_value(6, $"LineRenderer".get_layer_mask_value(6))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var start = global_position + (-global_basis.z * 0.1)
	var end = (-global_basis.z * 1) + start

	$"LineRenderer".points[0] = start
	$"LineRenderer".points[1] = end
	$"RayCast3D".target_position = $"RayCast3D".to_local(end)
	
	if $"RayCast3D".is_colliding():
		$"LineRenderer".points[1] = $"RayCast3D".get_collision_point()
		
		var cur_collider = $"RayCast3D".get_collider()
		if active_collider == null or active_collider != cur_collider:
			active_collider = cur_collider
			$"Block Break".play()
			cur_collider.get_parent_node_3d().queue_free()
			
	elif active_collider != null:
		active_collider = null


func _on_button_pressed(name: String) -> void:
	if name == "ax_button":
		toggled = !toggled
		$"LineRenderer".visible = toggled
		$"RayCast3D".enabled = toggled
