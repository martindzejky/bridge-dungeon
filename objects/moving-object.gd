extends Node2D
class_name MovingObject

const speed := 30.0 # TODO: this should be in game state so player can speed up

func _process(delta):
    get_parent().position.y += speed * delta
