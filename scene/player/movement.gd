extends State

class_name movements

@export var attack_state : State

func state_input(event: InputEvent):
	if(event.is_action_pressed("attack")):
		attack()

func attack():
	next_state = attack_state
	playback.travel("attack")
