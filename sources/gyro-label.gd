extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_text(str(0))
	
func _get_data():
	var gyro = Input.get_gyroscope()