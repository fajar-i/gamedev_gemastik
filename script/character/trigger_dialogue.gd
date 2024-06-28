extends Area2D

signal turn_off_physics

func _on_body_entered(body):
	turn_off_physics.emit()
	TransitionFade.transition()
	await TransitionFade.on_transition_finished
	set_physics_process(false)
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("boss1")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	GlobalVar.playerData.malam += 1
	GlobalVar.playerData.save()
	get_tree().change_scene_to_file("res://scene/map.tscn")
