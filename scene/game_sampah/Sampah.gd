extends Node2D

@onready var healthbar = $"../Camera2D/healthbar"
@onready var endScr = $"../endScreen"

const window_size = Vector2(1222, 515)
var location = Vector2()
var packed_scene = [
	preload("res://scene/game_sampah/Nonorganik.tscn"),
	preload("res://scene/game_sampah/Organik.tscn"),
	preload("res://scene/game_sampah/Berbahaya.tscn")
	]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	endScr.result = -1
	
	$"../TongSampah/Organik".modulate = Color.GREEN
	$"../TongSampah/Nonorganik".modulate = Color.YELLOW
	$"../TongSampah/Berbahaya".modulate = Color.RED
	
	for i in range(10):
		var x = randi() % packed_scene.size()
		location.x = randf_range(1, window_size.x)
		location.y = randf_range(1, window_size.y)
		var scene = packed_scene[x].instantiate()
		scene.position = location
		scene.jenis_sampah = scene.name
		add_child(scene)

func cek_menang(tong_sampah, jenis_sampah):
	if tong_sampah != jenis_sampah:
		var health = healthbar.health
		health -= 20
		healthbar._set_health(health)
		healthbar.health = health
	
	var beres

	if healthbar.health <= 0:
		endScr.result = 0
		beres = true

	elif $"../player".banyak_sampah == GlobalVar.skor_sampah:
		endScr.result = 1
		beres = true

	if beres:
		$"../Camera2D".hide()
		$"../TongSampah".hide()
		$"../TileMap".set_layer_z_index(1, -1)
		$"../TileMap".set_layer_z_index(0, -2)
		
		endScr.position = $"../player".position
		endScr.position.y -= 320
		endScr.start()
		endScr.show()
		
		var tween = get_tree().create_tween()
		tween.tween_property(endScr, "position", $"../player".position, 1).set_ease(Tween.EASE_OUT)
		$"../player".queue_free()
