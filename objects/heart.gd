extends Node2D
class_name Heart

func onHitPlayer():
    queue_free()

    $audio.play()
    $audio.reparent(get_parent())
