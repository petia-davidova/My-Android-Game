extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)
	
func _process(delta):
	var gyro = Input.get_gyroscope()
	set_text(str(gyro.x))