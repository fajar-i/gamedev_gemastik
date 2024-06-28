extends State

@export var return_state : State


func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "attack"):
		next_state = return_state
		playback.travel("move")
