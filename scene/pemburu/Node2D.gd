extends Node

@onready var endScr = $endScreen

var banyak_mob = 5
var started = false
var arrow = load("res://asset/arrow.png")
var chargedArrow = load("res://asset/chargedArrow.png")
var mob_scene = [
	preload("res://scene/pemburu/hewan.tscn"),
	preload("res://scene/pemburu/hewanTerbangg.tscn"),
	preload("res://scene/pemburu/hewanLidungJalan.tscn"),
	preload("res://scene/pemburu/hewanLindungTerbang.tscn")
]

func _ready():
	$"Country-platform-preview".z_index = -1
	$ProgressBar.hide()
	$skor.hide()
	GlobalVar.skor_sampah = 0
	Input.set_custom_mouse_cursor(arrow)
	
func _process(_delta):
	$skor.text = str("Hewan di tangkap:\n", GlobalVar.skor_sampah, "/", banyak_mob)
	
	if Input.is_action_pressed(("click")):
		$ProgressBar.value += 1
		
		if not started:
			started = true
			$MobTimer.start()
			$ProgressBar.show()
			$skor.show()
			$Label.queue_free()
	
	if Input.is_action_just_released("click"):
		$ProgressBar.value = 0 
		Input.set_custom_mouse_cursor(arrow)
	
	if $ProgressBar.value == 100:
		Input.set_custom_mouse_cursor(chargedArrow)
		
	if banyak_mob == GlobalVar.skor_sampah:
		$endScreen

func isCharged():
	if $ProgressBar.value >= 100:
		return true
		
func _on_mob_timer_timeout():
	var x = randi() % mob_scene.size()
	var mob = mob_scene[x].instantiate()
	
	if x == 0 or x == 2:
		mob.position = $jalan.position
	else:
		mob.position = $terbang.position
	
	if x > 1:
		mob.hewanLindung = true
		
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity
	
	add_child(mob)

func cekMenang(hewanLindung):
	var beres
	if hewanLindung:
		$endScreen.result = 0
		beres = true
		
	elif GlobalVar.skor_sampah == banyak_mob:
		$endScreen.result = 1
		beres = true
		
	if beres:
		$ProgressBar.hide()
		#endScr.position = $titikTengah.position
		endScr.position.y -= 320
		endScr.start()
		endScr.show()
		endScr.restartScene = "res://scene/pemburu/main_pemburu.tscn"
		
		var tween = get_tree().create_tween()
		tween.tween_property(endScr, "position", $titikTengah.position, 1).set_ease(Tween.EASE_OUT)
		$MobTimer.stop()
