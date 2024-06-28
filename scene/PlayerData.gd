extends Resource
class_name PlayerData

@export var malam : int

func save():
	ResourceSaver.save(GlobalVar.playerData, GlobalVar.save_file_path + GlobalVar.save_file_name)
	print("save")
	
func load_data():
	GlobalVar.playerData = ResourceLoader.load(GlobalVar.save_file_path + GlobalVar.save_file_name).duplicate(true)
	print("loaded")
