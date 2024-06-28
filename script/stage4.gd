extends Area2D

signal turn_off_physics

func _on_body_entered(body):
	turn_off_physics.emit()
	TransitionFade.transition()
	await TransitionFade.on_transition_finished
	Dialogic.start("ending")
	GlobalVar.playerData.malam += 1
	GlobalVar.playerData.save()
	get_tree().change_scene_to_file("res://scene/menu.tscn")
