extends CharacterBody2D
class_name Actor

var health : int
var speed : float

var desired_velocity : Vector2 = Vector2.ZERO
var steering_vector : Vector2 = Vector2.ZERO
var drag_factor : float = 0.1
