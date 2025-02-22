extends Node2D
class_name Spawner

const range := 70

@export var impScene: PackedScene
@export var impTimerFrom := 1.0
@export var impTimerTo := 4.0


func spawnImp():
    assert(impScene, 'Imp scene is not assigned!')

    var imp = impScene.instantiate()
    imp.position.x = randf_range(-range, range)
    add_child(imp)

    $impTimer.wait_time = randf_range(impTimerFrom, impTimerTo) / (GlobalState.playerSpeed / 40.0)
