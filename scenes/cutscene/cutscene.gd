extends Control

@export var next_level: PackedScene
@export var video_player: VideoStreamPlayer

func _ready() -> void:
	Audio.pause()
	await video_player.finished
	SceneManager.change_scene(next_level.resource_path)
	Audio.resume()
