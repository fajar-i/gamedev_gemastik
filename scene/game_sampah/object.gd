extends Node2D

var draggable = false
var is_inside_droppable = false
var body_ref
var offset: Vector2
var initialPos: Vector2
var jenis_sampah

func _ready():
	z_index = 2

func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			GlobalVar.is_dragging = true
			
		if Input.is_action_pressed("click"):
			z_index = 3
			global_position = get_global_mouse_position() - offset
			
		elif Input.is_action_just_released("click"):
			GlobalVar.is_dragging = false
			var tween = get_tree().create_tween()
			
			if is_inside_droppable :
				tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
				GlobalVar.skor_sampah += 1
				get_parent().cek_menang(body_ref.name, jenis_sampah)
				queue_free()
				
			else:
				tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)
			
			z_index = 2

func _on_area_2d_mouse_entered():
	if not GlobalVar.is_dragging:
		draggable = true
		scale = Vector2(1.2, 1.2)

func _on_area_2d_mouse_exited():
	if not GlobalVar.is_dragging:
		draggable = false
		scale = Vector2(1, 1)

func _on_area_2d_body_entered(body: StaticBody2D):
	if body.is_in_group('droppable'):
		is_inside_droppable = true
		body_ref = body
		
func _on_area_2d_body_exited(body):
	if body.is_in_group('droppable'):
		is_inside_droppable = false
		body_ref = body
