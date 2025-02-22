extends Node2D
class_name Player

@export var speed: float = 120.0
const bounds := 70

@export var isBeingHit := false
@export var hitSound: AudioStream
@export var deadSound: AudioStream

func _ready():
    GlobalState.onPlayerHit.connect(onPlayerHit)

func _process(delta):
    if not isBeingHit and GlobalState.playerHealth > 0:
        var direction = Input.get_action_strength('right') - Input.get_action_strength('left')
        position.x += direction * speed * delta
        position.x = clamp(position.x, -bounds, bounds);

        # TODO: TEST
        if Input.is_action_just_pressed('HIT'):
            GlobalState.takePlayerHealth()

func onPlayerHit():
    assert(hitSound, 'Missing hit sound!')
    assert(deadSound, 'Missing hit sound!')

    $audioHit.stream = hitSound
    $audioHit.play()

    get_tree().paused = true
    isBeingHit = true

    var previousAnimation = $animator.current_animation
    $animator.play('hit')

    var waitTime := 1
    if GlobalState.playerHealth == 0:
        waitTime = 3

    await get_tree().create_timer(waitTime).timeout

    if GlobalState.playerHealth > 0:
        get_tree().paused = false
        isBeingHit = false

        $animator.play(previousAnimation)
    else:
        $animator.play('dead')
