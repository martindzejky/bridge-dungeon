extends Node2D
class_name Imp

@export var speed := 10.0

func _ready():
    var animator = $animator
    animator.play('running')
    animator.seek(randf(), true)

    $moving.forwardSpeed = speed * (GlobalState.playerSpeed / 40.0)

func onHitPlayer():
    process_mode = PROCESS_MODE_ALWAYS
    $collider.queue_free()

    var previousAnimation = $animator.current_animation
    $animator.play('attack')

    await get_tree().create_timer(1).timeout

    process_mode = PROCESS_MODE_INHERIT
    $animator.play(previousAnimation)
