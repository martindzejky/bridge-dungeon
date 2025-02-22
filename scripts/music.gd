extends AudioStreamPlayer
class_name Music

@export var endingMusic: AudioStream

func _ready():
    GlobalState.onPlayerDead.connect(onPlayerDead)

func onPlayerDead():
    assert(endingMusic, 'Ending music is missing!')
    stop()
    await get_tree().create_timer(7).timeout
    stream = endingMusic
    play()
