extends Node2D

func _process(delta):
	pass

func _on_sampah_balaikota_pressed():
	get_tree().change_scene_to_file("res://scene/game_sampah/main_sampah.tscn")
