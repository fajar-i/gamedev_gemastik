extends CharacterBody2D
@onready var player_animation = $AnimatedSprite2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

enum {IDLE, WALK, ATTACK, SPECIAL, HURT}

var state = IDLE

func _ready():
	change_state(IDLE)

func change_state(new_state):
	state = new_state
	match state:
		IDLE:
			player_animation.play("idle")
		WALK:
			player_animation.play("run")
		HURT:
			player_animation.play("hurt")

func get_input():
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	
	velocity.x = 0
	if right:
		velocity.x += SPEED
		player_animation.flip_h = false
	if left:
		velocity.x -= SPEED
		player_animation.flip_h = true
	
	if state == IDLE and velocity.x != 0:
		change_state(WALK)
	if state == WALK and velocity.x == 0:
		change_state(IDLE)


func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta
	get_input()
	move_and_slide()
