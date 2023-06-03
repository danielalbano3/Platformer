extends Actor
class_name Player

@onready var anim : AnimationPlayer = $AnimationPlayer
@onready var player_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var visible_alert : VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D 
@onready var cam : Camera2D = $Camera2D

@export var speed : float = 300.0
@export var jump_strength : float = 20.0

var has_jumped : bool = false

func _ready() -> void:
	velocity = Vector2.ZERO

func _process(delta) -> void:
	move(delta)

func move(_del : float) -> void:
	var direction : Vector2 = Vector2.ZERO
	direction.x = Input.get_axis("go_left","go_right")
	
	if !is_on_floor(): 
		direction.y += gravity * drag_factor
	
	if Input.is_action_just_pressed("jump"):
		direction.y -= jump_strength
		has_jumped = true
	
	if direction.x > 1.0:
		direction = direction.normalized()
	
	desired_velocity = direction * speed
	steering_vector = desired_velocity - velocity
	velocity += steering_vector * drag_factor
	
	move_and_slide()
	
	if direction.x != 0.0:
		if direction.x < 0.0:
			player_sprite.flip_h = true
		else:
			player_sprite.flip_h = false
				

	if is_on_floor():
		if direction != Vector2.ZERO:
			player_sprite.play("run")
		elif direction == Vector2.ZERO:
			player_sprite.play("idle")
			
	if has_jumped:
		has_jumped = false
		player_sprite.play("jump")
		
	
	
