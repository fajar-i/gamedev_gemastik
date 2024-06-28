extends CharacterBody2D

class_name Snail
@onready var animation_tree = $AnimationTree
@onready var player_state_machine = $PlayerStateMachine


@export var SPEED = 50.0

@export var starting_direction : Vector2 = Vector2.LEFT
@export var hit_state : State
@export var max_health = 20

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

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
	var direction : Vector2 = starting_direction
	if direction and player_state_machine.check_if_can_move():
		velocity.x = direction.x * SPEED
	elif player_state_machine.current_state != hit_state:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
