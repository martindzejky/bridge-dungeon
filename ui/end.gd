extends Panel

func _ready():
    GlobalState.onPlayerDead.connect(onPlayerDead)

func onPlayerDead():
    $margin/center/menu/coins/text.text = str(GlobalState.playerCoins)
    $margin/center/menu/distance/text.text = str(round(GlobalState.distanceRun / 25)) + 'm'

    await get_tree().create_timer(7).timeout

    show()
    $animation.play('fade')
