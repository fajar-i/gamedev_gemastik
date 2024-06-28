extends Control

@onready var volume = $TextureRect/MarginContainer/VBoxContainer/Volume

func _ready():
	volume.min_value = 0.0
	volume.max_value = 1.0
	volume.step = 0.01  # Adjust the step for finer control if needed
	volume.value = 0.7  # Set initial volume to 50%

func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear2db(value))

func linear2db(linear):
	return 20.0 * log_with_base(linear, 10)

func log_with_base(value, base):
	return log(value) / log(base)

func _on_full_screen_toggled(toggled_on):
	pass # Replace with function body.
	
