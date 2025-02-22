extends Node2D
class_name Barrel

func onHitPlayer():
    process_mode = PROCESS_MODE_ALWAYS
    $collider.queue_free()

    $animator.play('destroy')
    await $animator.animation_finished
    queue_free()
