extends Node2D
class_name Spawner

@export var spawnee: PackedScene
@export var spawns_per_wave: Array[int]
@onready var spawnpoints = get_children() as Array[Marker2D]

var current_index = -1

func _ready() -> void:
	await get_tree().create_timer(1.0).timeout
	trigger()


func trigger() -> void:
	var spawnpoint = spawnpoints.pick_random()
	var instance = spawnee.instantiate()
	instance.global_position = spawnpoint.global_position
	get_tree().root.add_child(instance)
