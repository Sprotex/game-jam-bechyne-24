extends Node
class_name AnimationPrioritiesPlayer

@export var animated_sprite: AnimatedSprite2D
@export var body: CharacterBody2D
@export var flip_node: Node2D

var _current_priority := AnimationConstants.PRIORITY_RESET


func _ready() -> void:
	animated_sprite.animation_finished.connect(_handle_animation_finished)
	animated_sprite.animation_looped.connect(_handle_animation_finished)
	play(AnimationConstants.ANIMATION_IDLE, AnimationConstants.PRIORITY_RESET)

## Higher the priority animations overwrites lower priority ones.
## Except for [Constant AnimationConstants.PRIORITY_RESET]
func play(animation: String, priority: int) -> bool:
	if _current_priority > priority and priority != AnimationConstants.PRIORITY_RESET:
		return false
	animated_sprite.play(animation)
	_current_priority = priority
	return true


func _play_reset_internal(animation: String) -> void:
	animated_sprite.play(animation, AnimationConstants.PRIORITY_RESET)


func _handle_animation_finished() -> void:
	var next_animation = AnimationConstants.ANIMATION_IDLE
	if body.velocity.length_squared() > 0.01:
		next_animation = AnimationConstants.ANIMATION_WALK
	play(next_animation, AnimationConstants.PRIORITY_RESET)
	_handle_flip()


func _handle_flip() -> void:
	var return_conditions = [
		animated_sprite.animation != AnimationConstants.ANIMATION_WALK,
		body.velocity.x > -0.01 and animated_sprite.flip_h,
		body.velocity.x <  0.01 and not animated_sprite.flip_h
	]
	if return_conditions.any(Helpers.test):
		return
	flip_horizontal()


func flip_horizontal() -> void:
	flip_node.scale *= Vector2(-1, 1)
	animated_sprite.flip_h = not animated_sprite.flip_h
