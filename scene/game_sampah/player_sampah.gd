extends Node2D

@onready var healthbar = $"../Camera2D/healthbar"
@onready var tong_sampah = $"../TongSampah"
@onready var kamera = $"../Camera2D"
@onready var endScr = $"../endScreen"
@onready var map = $"../TileMap"

var banyak_sampah = 12 - (GlobalVar.playerData.malam * 2)
var health = 100
var speed = 150

func _enter_tree():
	request_ready()

# Called when the node enters the scene tree for the first time.
func _ready():
	health = 100
	endScr.hide()
	endScr.result = -1
	healthbar.init_health(health)
	healthbar.z_index = 5
	position.x =  80
	position.y =  50
	GlobalVar.skor_sampah = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("gerak_kanan"):
		velocity.x += 1
		rotation_degrees = 90
	if Input.is_action_pressed("gerak_kiri"):
		velocity.x -= 1
		rotation_degrees = -90
	if Input.is_action_pressed("gerak_atas"):
		velocity.y -= 1
		rotation_degrees = 0
	if Input.is_action_pressed("gerak_bawah"):
		velocity.y += 1
		rotation_degrees = 180
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	if Input.is_action_pressed("sprint"):
		velocity = velocity * 1.8
		
	var target_tile = map.local_to_map(position + (velocity * delta))
	var tile_data: TileData = map.get_cell_tile_data(0, target_tile)
	
	if  tile_data.get_custom_data("jalan"):
		position += velocity * delta
	
	kamera.position = position
	tong_sampah.position = position
	
	if GlobalVar.is_dragging:
		tong_sampah.position.y -= 30

#kamera dinamis keren : 
#$"../Camera2D".offset = (mouse_position - global_position) / (4)
