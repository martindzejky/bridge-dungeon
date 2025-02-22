extends Node
class_name MovingObject

# if > 0, the object will be running forward (in addition to player's speed)
@export var forwardSpeed := 0.0

func _process(delta):
    get_parent().position.y += (GlobalState.playerSpeed + forwardSpeed) * delta
