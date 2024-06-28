extends RigidBody2D

var Aimed
var hewanLindung
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()

func _process(delta):
	if Aimed and Input.is_action_just_released("click"):
		GlobalVar.skor_sampah += 1
		hide()
		get_parent().cekMenang(hewanLindung)
		

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

func _on_area_2d_mouse_entered():
	Aimed = get_parent().isCharged()

func _on_area_2d_mouse_exited():
	Aimed = false
