extends Label

@onready var target = $"../../player".banyak_sampah

func _ready():
	z_index = 5
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = str("Sampah terkumpul\n", GlobalVar.skor_sampah, "/", target)
