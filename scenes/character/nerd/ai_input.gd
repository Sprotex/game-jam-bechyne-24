extends CharacterInput
class_name AIInput

var has_player_in_area := false
var cooldown_in_progress := false
@export var attack_delay := 0.8


func _on_hit_box_area_2d_body_entered(body: Node2D) -> void:
	if not body == Globals.player:
		return
	has_player_in_area = true


func _on_hit_box_area_2d_body_exited(body: Node2D) -> void:
	if not body == Globals.player:
		return
	has_player_in_area = false
