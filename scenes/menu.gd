extends MarginContainer

@export var next_scene: PackedScene

func _on_start_game_button_pressed() -> void:
	SceneManager.change_scene(next_scene.resource_path)
