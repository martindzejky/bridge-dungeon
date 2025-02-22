extends TextureRect

@export var brokenHeartScene: PackedScene

func destroy():
    queue_free()

    assert(brokenHeartScene, 'Broken heart scene missing!')

    var broken := brokenHeartScene.instantiate()
    var pos := get_global_transform_with_canvas().origin
    broken.global_position = pos + Vector2(8, 8)

    get_tree().call_group('ui-effects', 'add_child', broken)
