extends Node
class_name MovingObject

func _process(delta):
    get_parent().position.y += GlobalState.playerSpeed * delta
