extends Node2D

var is_transitioning := false
@export var next_scene: PackedScene

func _on_area_2d_body_entered(body: Node2D) -> void:
	if is_transitioning:
		return
	if body != Globals.player:
		return
	is_transitioning = true
	SceneManager.change_scene(next_scene.resource_path, { "speed": 10 })
