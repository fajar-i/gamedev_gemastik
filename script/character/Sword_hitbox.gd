extends Area2D

@export var player : Player
@onready var collision_shape_2d = $CollisionShape2D

func _ready():
	player.connect("facing_direction_change", _on_player_facing_direction_changed)

# cek yang masuk tu apa, yang dilihat itu parent nya
func _on_body_entered(body):
	# lalu, dari parent yang masuk itu, ada gak anak node yang namanya damageable
	# scanning satu per satu node
	for child in body.get_children():
		#, ketika nemu damageable:
		if child is damageable:
			# perhitungan untuk knockback
			var direction_to_damageable = (body.global_position - get_parent().global_position)
			var direction_sign = sign(direction_to_damageable.x)
			
			# hit, menigirim damage dan arah knockback ke node damageable
			# meskipun node nya itu tidak ada di player, hanya ada di snail.
			# karena! pemanggilannya itu child.hit. atau, bisa dibilang: damageable.hit()
			if(direction_sign > 0):
				child.hit(10, Vector2.RIGHT)
			elif(direction_sign < 0):
				child.hit(10, Vector2.LEFT)
			

func _on_player_facing_direction_changed(facing_right : bool):
	if(facing_right):
		collision_shape_2d.position = collision_shape_2d.facing_right_position
	else:
		collision_shape_2d.position = collision_shape_2d.facing_left_position
