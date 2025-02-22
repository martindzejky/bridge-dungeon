extends Node2D

@export var towerScene: PackedScene
@export var leftSpawn: Node2D
@export var rightSpawn: Node2D

func spawnTower():
    assert(towerScene, 'Missing tower scene!')
    assert(leftSpawn and rightSpawn, 'Missing spawn positions!')

    var leftTower = towerScene.instantiate()
    leftTower.position = leftSpawn.position
    add_child(leftTower)

    var rightTower = towerScene.instantiate()
    rightTower.position = rightSpawn.position
    add_child(rightTower)
