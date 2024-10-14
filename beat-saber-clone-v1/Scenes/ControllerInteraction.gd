extends XRController3D

var entered_area = null
var grabbed = null
var last_pos


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	last_pos = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if grabbed != null:
		var delta_pos = global_position - last_pos
		grabbed.global_position += delta_pos
		
	last_pos = global_position


func _on_area_3d_area_entered(area: Area3D) -> void:
	entered_area = area


func _on_area_3d_area_exited(area: Area3D) -> void:
	entered_area = null


func _on_input_float_changed(name: String, value: float) -> void:
	if name == "grip":
		if grabbed == null and entered_area != null and value >= 0.2:
			grabbed = entered_area.get_parent_node_3d()
			
		if grabbed != null and value < 0.2:
			grabbed = null
