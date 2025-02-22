extends Control

@export var heartScene: PackedScene

func _ready():
    GlobalState.onPlayerHit.connect(updateHearts)
    GlobalState.onPlayerHealed.connect(updateHearts)
    updateHearts()

func updateHearts():
    assert(heartScene, 'Missing heart scene!')

    if GlobalState.playerHealth == get_child_count():
        return

    var currentHearts = get_child_count()
    var targetHearts = GlobalState.playerHealth

    # add missing hearts
    while currentHearts < targetHearts:
        var heart = heartScene.instantiate()
        add_child(heart)
        currentHearts += 1

    # remove extra hearts
    while currentHearts > targetHearts:
        get_child(currentHearts - 1).destroy()
        currentHearts -= 1
