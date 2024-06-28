extends MarginContainer

@onready var life_counter = $HBoxContainer/Life_Counter

func _on_damageable_health_ui(health):
	for heart in life_counter.size():
		life_counter[heart].visible = health > heart
