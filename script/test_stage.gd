extends Node2D
@onready var audio_stream_player = $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	audio_stream_player.play()


func _on_dialogic_signal(argument:String):
	if argument == "wrong_answer":
		get_tree().reload_current_scene();
	GlobalVar.playerData.malam += 1
	GlobalVar.playerData.save()
	get_tree().change_scene_to_file("res://scene/map.tscn")
	
