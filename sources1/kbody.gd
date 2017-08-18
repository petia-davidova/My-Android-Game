extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	move(Vector2(-14.0, 3.0))
