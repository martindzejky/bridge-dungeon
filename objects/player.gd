extends Node2D
class_name Player

@export var speed: float = 120.0
const bounds := 70

func _process(delta):
    var direction = Input.get_action_strength('right') - Input.get_action_strength('left')
    position.x += direction * speed * delta
    position.x = clamp(position.x, -bounds, bounds);
