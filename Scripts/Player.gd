extends Actor
class_name Player

@onready var animation_list : PackedStringArray = $AnimatedSprite2D.sprite_frames.get_animation_names()
@onready var anim : AnimationPlayer = $AnimationPlayer
@onready var visible_alert : VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D 

@export var speed : float = 300.0
@export var jump_strength : float = 20.0

func _ready():
	speed = 300.0
	velocity = Vector2.ZERO

func _process(delta):
	move(delta)

func move(_del : float) -> void:
	var direction : Vector2 = Vector2.ZERO
	direction.x = Input.get_axis("go_left","go_right")
	
	if !is_on_floor(): 
		direction.y += gravity * drag_factor
	
	if Input.is_action_just_pressed("jump"):
		direction.y -= 20.0
	
	if direction.x > 1.0:
		direction = direction.normalized()
	
	desired_velocity = direction * speed
	steering_vector = desired_velocity - velocity
	velocity += steering_vector * drag_factor
	
	move_and_slide()
