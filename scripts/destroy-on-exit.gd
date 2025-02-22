extends Node
class_name DestroyOnExit

func _process(_delta):
    if get_parent().global_position.y > 200:
        get_parent().queue_free()
