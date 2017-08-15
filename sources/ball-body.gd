extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var label = get_parent().get_node("vel-lab")

var initial_v = Vector2(0.0, 3.0)
var velocity = Vector2()
var movement_remainder

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	move(initial_v)
	label.set_text("x: " + str(velocity.x) + ", y: " + str(velocity.y))
	#var input_direction = Input.get_gyroscope().x
	#velocity = initial_v
	#print(str(get_collider()))
	#var velocity = get_linear_velocity()
	#if is_colliding():
		#var n = get_collision_normal()
	#	movement_remainder = move(velocity)
		#move(Vector2(0.0, 2.0))
		
	
