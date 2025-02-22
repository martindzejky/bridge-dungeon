extends HBoxContainer

func _ready():
    GlobalState.onPlayerCoinUpdate.connect(updateCoins)
    updateCoins()

func updateCoins():
    $text.text = str(GlobalState.playerCoins)
