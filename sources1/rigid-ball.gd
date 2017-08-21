extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
#	set_angular_velocity(Vector3(10.0,10.0,10.0))
	set_linear_velocity(Vector2(60, -40))
	print("x: " + str(get_linear_velocity().x) + " y: " + str(get_linear_velocity().y))
