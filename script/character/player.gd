extends CharacterBody2D

class_name Player

@onready var animation_tree = $AnimationTree
@onready var sprite = $Sprite2D
@onready var player_state_machine = $PlayerStateMachine

@export var max_health : int = 70
@export var speed : float = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


signal facing_direction_change(facing_right : bool)

func _ready():
	animation_tree.active = true

func get_hit(value):
	pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0 and player_state_machine.check_if_can_move():
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	animation_tree.set("parameters/move/blend_position", direction)
	
	if direction < 0:
		sprite.flip_h = true
		
	elif direction > 0:
		sprite.flip_h = false
	
	emit_signal("facing_direction_change", !sprite.flip_h)
	move_and_slide()
