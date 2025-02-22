extends Node

# how fast the player is running... all objects are moving down this fast
var playerSpeed := 40.0

var playerHealth := 3
signal onPlayerHit
signal onPlayerHealed
signal onPlayerDead

# total distance run
var distanceRun := 0.0

var playerCoins := 0
signal onPlayerCoinUpdate

func _process(delta):
    playerSpeed += delta * 2.0
    distanceRun += delta * playerSpeed

func updatePlayerHealth(health: int):
    var previous := playerHealth
    playerHealth = max(health, 0)

    if playerHealth > previous:
        onPlayerHealed.emit()
    elif playerHealth < previous:
        onPlayerHit.emit()

    if playerHealth == 0:
        onPlayerDead.emit()

func addPlayerHealth():
    updatePlayerHealth(playerHealth + 1)

func takePlayerHealth():
    updatePlayerHealth(playerHealth - 1)

func addCoin():
    playerCoins += 1
    onPlayerCoinUpdate.emit()
