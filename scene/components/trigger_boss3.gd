extends Area2D



func _on_body_entered(body):
	TransitionFade.transition()
	await TransitionFade.on_transition_finished
	Dialogic.start("boss3")
