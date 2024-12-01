extends Sprite2D


@export var max_rotation = 10.0
@export var max_offset_scale = 5.0
var starting_position: Vector2


func _ready() -> void:
	starting_position = global_position


func _process(delta: float) -> void:
	rotation_degrees = randf() * max_rotation
	var random_offset = Vector2(randf(), randf()) * max_offset_scale
	global_position = starting_position + random_offset
