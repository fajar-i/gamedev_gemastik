extends ProgressBar

var parent
var max_value_amount
var min_value_amount = 0

func _ready():
	parent = get_parent()
	max_value_amount = parent.max_health
	value = max_value_amount


func _on_damageable_health_ui(health):
	value = health
	if health != max_value_amount:
		self.visible = true
		if health == min_value_amount:
			self.visible = false
	else:
		self.visible = false
