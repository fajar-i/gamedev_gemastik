extends Area2D

signal turn_off_physics

func _on_body_entered(body):
	turn_off_physics.emit()
	TransitionFade.transition()
	await TransitionFade.on_transition_finished
	Dialogic.start("boss2")
