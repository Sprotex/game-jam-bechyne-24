extends Node

@export var input: PlayerInput
@export var animated_sprite: AnimatedSprite2D
@export var damage_mean := 20.0
@export var damage_variation := 10.0

func _ready() -> void:
	input.on_light_attack_input.connect(_handle_light_attack)
	input.on_heavy_attack_input.connect(_handle_heavy_attack)


func _return_to_default_after_animation() -> void:
	animated_sprite.animation_finished.connect(func(): 
		animated_sprite.play(PlayerConstants.ANIMATION_DEFAULT_KEY), CONNECT_ONE_SHOT)


func _handle_light_attack() -> void:
	_return_to_default_after_animation()
	animated_sprite.play(PlayerConstants.ANIMATION_HEAVY_KEY)


func _handle_heavy_attack() -> void:
	_return_to_default_after_animation()
	animated_sprite.play(PlayerConstants.ANIMATION_HEAVY_KEY)
