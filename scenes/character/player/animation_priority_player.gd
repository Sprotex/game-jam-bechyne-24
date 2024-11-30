extends Node
class_name AnimationPrioritiesPlayer

@export var animated_sprite: AnimatedSprite2D

var _current_priority := AnimationConstants.PRIORITY_RESET

## Higher the priority animations overwrites lower priority ones.
## Except for [Constant AnimationConstants.PRIORITY_RESET]
func play(animation: String, priority: int) -> bool:
	if _current_priority > priority and priority != AnimationConstants.PRIORITY_RESET:
		return false
	animated_sprite.play(animation)
	_current_priority = priority
	return true
