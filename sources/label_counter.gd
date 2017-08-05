extends Label

var countdown_time = 100
var rounded_time = 0


func _ready():
	set_process(true)
	
func _process(delta):
	countdown_time -= delta
	rounded_time = round(countdown_time)
	set_text(str(rounded_time))
	pass