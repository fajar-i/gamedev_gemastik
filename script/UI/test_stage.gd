extends Node2D
@onready var player = $player
@onready var label = $Camera2D/CanvasLayer/Label


# Called when the node enters the scene tree for the first time.
func _ready():
	player.connect("health_ui", update_health_ui)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_health_ui(health):
	label.text = str(health)
