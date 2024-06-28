extends State

class_name hit_state
@onready var timer = $Timer

@export var Damageable : damageable_snail
@export var character_state_machine : PlayerStateMachine
@export var dead_state : State
@export var knockback_speed : float = 100.0
@export var return_state : State

func _ready():
	Damageable.connect("on_hit", on_damageable_hit)

func on_enter():
	timer.start()

func on_exit():
	character.velocity = Vector2.ZERO

func on_damageable_hit(node : Node, damage_amount : int, knockback_direction : Vector2):
	if(Damageable.health > 0):
		character.velocity = knockback_speed * knockback_direction
		
		emit_signal("interrupt_state", self)
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel("death")



func _on_timer_timeout():
	next_state = return_state
