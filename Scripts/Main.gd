extends Node2D

@onready var parlx : ParallaxBackground = $ParallaxBackground
@onready var player : Player = $Player

@export var scrollspeed : float = 5.0

func _process(delta):
	move_background(delta)

func move_background(del : float) -> void:
	parlx.scroll_base_offset.x -= scrollspeed * del
