extends Node

@export var state: StateChartState

func _on_area_2d_body_entered(body: Node2D) -> void:
	if not state.active:
		return
	if body != Globals.player:
		return
	state._chart.send_event("transition_to_follow_player")
