extends Node2D

func _ready():
    $sprite.frame = randi() % $sprite.hframes
