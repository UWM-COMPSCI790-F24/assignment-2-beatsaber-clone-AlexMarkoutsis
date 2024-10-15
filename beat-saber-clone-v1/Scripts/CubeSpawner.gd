extends Node3D

var spawn_interval
var min_interval = 0.5
var max_interval = 2.0
var cube_scene = preload("res://Scenes/Instances/BeatCube.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	schedule_next_spawn()
	
func schedule_next_spawn() -> void:
	spawn_interval = randf_range(min_interval, max_interval)
	var timer = $"Timer"
	timer.wait_time = spawn_interval
	timer.start()
	
func _on_timer_timeout() -> void:
	var cube_instance = cube_scene.instantiate()
	var collision_shape = cube_instance.get_node("Area3D")
	if randi() % 2 == 0:
		cube_instance.material_override = preload("res://Assets/Materials/Blue Base.tres")
		collision_shape.set_collision_layer_value(1, false)
		collision_shape.set_collision_layer_value(6, true)
	else:
		cube_instance.material_override = preload("res://Assets/Materials/Red Base.tres")
	add_child(cube_instance)
	schedule_next_spawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
