extends Node

@export var body: CharacterBody2D
@export var input: CharacterInput

func _on_follow_player_state_processing(delta: float) -> void:
	var player_position = Globals.player.global_position
	var diff = player_position - body.global_position
	input.input_movement = diff.normalized()


func _on_follow_player_state_exited() -> void:
	input.input_movement = Vector2.ZERO
