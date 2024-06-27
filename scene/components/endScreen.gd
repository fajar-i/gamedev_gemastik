extends Control

var result
var restartScene

func start():
	if result == 1:
		$Label.text = str("Selesai!")
		$Button.text = str("Kembali")
	
	elif result == 0:
		$Label.text = str("Kalah")
		$Button.text = str("Ulangi")

func _on_button_pressed():
	if result == 1:
		get_tree().change_scene_to_file("res://scene/map.tscn")
	
	elif result == 0:
		get_tree().change_scene_to_file(restartScene)
