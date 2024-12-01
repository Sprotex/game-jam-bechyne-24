extends Node

@export var node_to_free: Node2D
@export var max_health := 3

@onready var current_health = max_health: 
	set(new_value):
		current_health = new_value

var current_areas: Array[Area2D]
var is_processing_damage = false


func _process(delta: float) -> void:
	if is_processing_damage:
		return
	if current_areas.is_empty():
		return
	is_processing_damage = true
	_set_health(current_health - 1)
	node_to_free.modulate = Color(1,1,1,.5)
	await get_tree().create_timer(1.0).timeout
	node_to_free.modulate = Color(1,1,1,1)
	is_processing_damage = false


func _set_health(new_value: int) -> void:
	if current_health == new_value:
		return
	current_health = new_value
	if current_health <= 0:
		node_to_free.queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	current_areas.append(area)


func _on_area_2d_area_exited(area: Area2D) -> void:
	var index = current_areas.find(area)
	if index < 0:
		return
	current_areas.remove_at(index)
