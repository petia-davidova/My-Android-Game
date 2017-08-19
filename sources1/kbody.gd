extends KinematicBody2D

# variable for gravity - constant
const GRAVITY = 10.0
const WALK_SPEED = 400
var gyro = Input.get_gyroscope()
# variable for ball's velocity
var velocity = Vector2()

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	velocity.y += GRAVITY * delta
	if (Input.get_accelerometer().x > 0):
        velocity.x = -WALK_SPEED
	elif (Input.get_accelerometer().x < 0):
        velocity.x =  WALK_SPEED
	else:
        velocity.x = 0

	var motion = velocity * delta
	move(motion)
