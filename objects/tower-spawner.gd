extends Node2D

@export var towerScene: PackedScene
@export var leftSpawn: Node2D
@export var rightSpawn: Node2D

func _ready():
    prespawnTowers()

func spawnTower(offset = 0.0):
    assert(towerScene, 'Missing tower scene!')
    assert(leftSpawn and rightSpawn, 'Missing spawn positions!')

    var leftTower = towerScene.instantiate()
    leftTower.position = leftSpawn.position
    leftTower.position.y += offset
    add_child(leftTower)

    var rightTower = towerScene.instantiate()
    rightTower.position = rightSpawn.position
    rightTower.position.y += offset
    add_child(rightTower)

    $timer.wait_time = 3.0 / 40.0 * GlobalState.playerSpeed

func prespawnTowers():
    var offset := 0

    while offset < 150 - global_position.y:
        spawnTower(offset)
        offset += GlobalState.playerSpeed * $timer.wait_time
