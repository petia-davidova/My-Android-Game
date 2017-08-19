extends KinematicBody2D

# variable for gravity - constant
const GRAVITY = Vector2(0, 10)

# variable for ball's velocity
var velocity = Vector2()

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	velocity += GRAVITY * delta
	move(velocity)
