extends Node
class_name CharacterAttack

@export var input: CharacterInput
@export var animated_sprite: AnimationPrioritiesPlayer
@export var damage_mean := 20.0
@export var damage_variation := 10.0


func _ready() -> void:
	input.on_light_attack_input.connect(_handle_light_attack)
	input.on_heavy_attack_input.connect(_handle_heavy_attack)


func _handle_light_attack() -> void:
	animated_sprite.play(AnimationConstants.ANIMATION_LIGHT_ATTACK, AnimationConstants.PRIORITY_ATTACK)


func _handle_heavy_attack() -> void:
	animated_sprite.play(AnimationConstants.ANIMATION_HEAVY_ATTACK, AnimationConstants.PRIORITY_ATTACK)
