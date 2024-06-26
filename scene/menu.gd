extends Control

@onready var button = $Button2
@onready var button3 = $Button3

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scene/map.tscn")

