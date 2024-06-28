extends Node2D

func _ready():
	$Label.text = str("Hari ke\n", GlobalVar.playerData.malam)
	$Label2.text = str("Misi selesai\n", GlobalVar.playerData.siang, "/2")
	if GlobalVar.playerData.siang < 2:
		$malam.disabled = true
	else:
		$malam.disabled = false

func _on_sampah_balaikota_pressed():
	get_tree().change_scene_to_file("res://scene/game_sampah/main_sampah.tscn")

func _on_pemburu_utara_pressed():
	get_tree().change_scene_to_file("res://scene/pemburu/main_pemburu.tscn")

func _on_kembali_pressed():
	get_tree().change_scene_to_file("res://scene/menu.tscn")

func _on_malam_pressed():
	if GlobalVar.playerData.malam == 1:
		get_tree().change_scene_to_file("res://scene/Stage1.tscn")
	elif GlobalVar.playerData.malam == 2:
		get_tree().change_scene_to_file("res://scene/Stage2.tscn")
	elif GlobalVar.playerData.malam == 3:
		get_tree().change_scene_to_file("res://scene/Stage3.tscn")
	elif GlobalVar.playerData.malam == 3:
		get_tree().change_scene_to_file("res://scene/Stage4.tscn")
