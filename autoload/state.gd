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
    distanceRun += delta * playerSpeed

    if playerSpeed > 220:
        playerSpeed += delta * 1.2
    if playerSpeed > 100:
        playerSpeed += delta * 1.6
    else:
        playerSpeed += delta * 2.0

func updatePlayerHealth(health: int):
    var previous := playerHealth
    playerHealth = clampi(health, 0, 3)

    if playerHealth > previous:
        onPlayerHealed.emit()
    elif playerHealth < previous:
        onPlayerHit.emit()

        # decrease the speed a little
        if playerSpeed <= 80:
            playerSpeed = 40
        else:
            var diff := playerSpeed - 40
            playerSpeed = 40 + diff * 0.4

    if playerHealth == 0:
        onPlayerDead.emit()

func addPlayerHealth():
    updatePlayerHealth(playerHealth + 1)

func takePlayerHealth():
    updatePlayerHealth(playerHealth - 1)

func addCoin():
    playerCoins += 1
    onPlayerCoinUpdate.emit()
