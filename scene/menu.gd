extends Control

@onready var button = $Button2
@onready var button3 = $Button3

#ketika game di buka, Saved progress akan langsung di load
func _ready():
	verify_save_directory(GlobalVar.save_file_path)
	$Setting.position.x -= 300

func verify_save_directory(path: String):
	GlobalVar.playerData.load_data()
	$Lanjut.text = str("Lanjut\nhari ke ", GlobalVar.playerData.malam)
	DirAccess.make_dir_absolute(path)

#jika memilih new game, data akan di overwrite menjadi 0
func _on_mulai_pressed():
	GlobalVar.playerData = PlayerData.new()
	GlobalVar.playerData.save()
	get_tree().change_scene_to_file("res://scene/map.tscn")

func _on_lanjut_pressed():
	get_tree().change_scene_to_file("res://scene/map.tscn")

func _on_setting_2_toggled(toggled_on):
	if toggled_on:
		$Setting.position.x += 300
	else:
		$Setting.position.x -= 300
