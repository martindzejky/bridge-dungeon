extends Node2D
class_name Spawner

const bounds := 70

@export var impScene: PackedScene
@export var impTimerFrom := 1.0
@export var impTimerTo := 4.0

@export var imperScene: PackedScene
@export var imperTimerFrom := 4.0
@export var imperTimerTo := 8.0

@export var barrelScene: PackedScene
@export var barrelTimerFrom := 4.0
@export var barrelTimerTo := 8.0

@export var coinScene: PackedScene
@export var coinTimerFrom := 8.0
@export var coinTimerTo := 20.0

@export var heartScene: PackedScene
@export var heartTimerFrom := 16.0
@export var heartTimerTo := 22.0


func spawnImp():
    assert(impScene, 'Imp scene is not assigned!')

    var imp = impScene.instantiate()
    imp.position.x = randf_range(-bounds, bounds)
    add_child(imp)

    $impTimer.wait_time = randf_range(impTimerFrom, impTimerTo) / (GlobalState.playerSpeed / 40.0)

func spawnImper():
    # progress timer...
    if GlobalState.playerSpeed < 50:
        return

    assert(imperScene, 'Imper scene is not assigned!')

    var imper = imperScene.instantiate()
    imper.position.x = randf_range(-bounds, bounds)
    add_child(imper)

    $imperTimer.wait_time = randf_range(imperTimerFrom, imperTimerTo) / (GlobalState.playerSpeed / 40.0)

func spawnBarrel():
    assert(barrelScene, 'Barrel scene is not assigned!')

    var barrel = barrelScene.instantiate()
    barrel.position.x = randf_range(-bounds, bounds)
    add_child(barrel)

    $barrelTimer.wait_time = randf_range(barrelTimerFrom, barrelTimerTo) / (GlobalState.playerSpeed / 40.0)

func spawnCoin():
    assert(coinScene, 'Coin scene is not assigned!')

    var coin = coinScene.instantiate()
    coin.position.x = randf_range(-bounds, bounds)
    add_child(coin)

    $coinTimer.wait_time = randf_range(coinTimerFrom, coinTimerTo) / (GlobalState.playerSpeed / 40.0)


func spawnHeart():
    assert(heartScene, 'Heart scene is not assigned!')

    var heart = heartScene.instantiate()
    heart.position.x = randf_range(-bounds, bounds)
    add_child(heart)

    $heartTimer.wait_time = randf_range(heartTimerFrom, heartTimerTo) / (GlobalState.playerSpeed / 40.0)
