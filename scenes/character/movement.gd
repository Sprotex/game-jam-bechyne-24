extends Node
class_name Movement

@export var input: CharacterInput
@export var body: CharacterBody2D
@export var move_speed := 1.0


func _physics_process(_delta: float) -> void:
	body.velocity = input.input_movement * move_speed
	body.move_and_slide()
