extends Actor
class_name Player

func _process(delta):
	move(delta)

func move(_del : float) -> void:
	var direction : Vector2 = Vector2.ZERO
	direction.x = Input.get_axis("go_left","go_right")


		
