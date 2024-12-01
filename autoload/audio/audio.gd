extends Node2D

@export var music: AudioStreamPlayer

func pause() -> void:
	music.playing = false

func resume() -> void:
	music.playing = true
