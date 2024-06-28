extends Node

class_name damageable

signal on_hit(node : Node, damage_taken : int, knockback_direction: Vector2)
signal health_ui(health)

@export var health : float = 20.0:
	get:
		return health
	set(value):
		SignalBus.emit_signal("on_health_changed", get_parent(), value - health)
		health = value

func _ready():
	emit_signal("health_ui", health)

func hit(damage: int , knockback_direction : Vector2):
	health -= damage
	get_parent().get_hit(health)
	# on_hit diterima pada statemachinte
	emit_signal("health_ui", health)
	emit_signal("on_hit", get_parent(), damage, knockback_direction)


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "death":
		get_parent().queue_free()
