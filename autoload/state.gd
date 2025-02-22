extends Node

# how fast the player is running... all objects are moving down this fast
var playerSpeed := 40.0

var playerHealth := 3
signal onPlayerHit
signal onPlayerHealed
signal onPlayerDead

func _process(delta):
    playerSpeed += delta * 2.0

func updatePlayerHealth(health: int):
    var previous := GlobalState.playerHealth
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
