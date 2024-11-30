extends Node

@export var body: CharacterBody2D

func _ready() -> void:
	Globals.player = body
