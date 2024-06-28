extends Control

#ketika game di buka, Saved progress akan langsung di load
func _ready():
	verify_save_directory(GlobalVar.save_file_path)
	$Setting.hide()

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
		$Setting.show()
	else:
		$Setting.hide()

func _on_credit_toggled(toggled_on):
	if toggled_on:
		$Background.z_index = 2
		$Credit.z_index = 2
		$creditUI.z_index = 2
		$creditUI.show()
	else:
		$Background.z_index = 0
		$Credit.z_index = 0
		$creditUI.z_index = 0
		$creditUI.hide()


func _on_quit_pressed():
	get_tree().quit()
