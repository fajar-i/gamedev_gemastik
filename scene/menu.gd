extends Control

@onready var button = $Button2
@onready var button3 = $Button3

func _ready():
	verify_save_directory(GlobalVar.save_file_path)

func verify_save_directory(path: String):
	DirAccess.make_dir_absolute(path)
	
func _on_mulai_pressed():
	get_tree().change_scene_to_file("res://scene/map.tscn")
	
func _on_save_pressed():
	GlobalVar.playerData.save()

func _on_lanjut_pressed():
	GlobalVar.playerData.load_data()
	on_start_load()

func on_start_load():
	$Lanjut.text = str(GlobalVar.playerData.malam)

func _on_close_pressed():
	GlobalVar.playerData.malam += 1
	print(GlobalVar.playerData.malam)
