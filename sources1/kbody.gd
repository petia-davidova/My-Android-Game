extends KinematicBody2D

# variable for gravity - constant
const GRAVITY = 9.8
const WALK_SPEED = 400
var accel = Input.get_accelerometer()
var initial_motion = Vector2(18, -10)
var motion = Vector2(18, -10)
var move_x = motion.x
var move_y = motion.y
# variable for ball's velocity
var velocity = Vector2()

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
#	motion.y += GRAVITY * delta/2
#	if (Input.get_accelerometer().x > 0):
#        velocity.x = -WALK_SPEED
#	elif (Input.get_accelerometer().x < 0):
#        velocity.x =  WALK_SPEED
#	else:
#        velocity.x = 0
#
#	var motion = velocity * delta
#	motion = Vector2(8, 8)
#	motion = initial_motion

	var angle_rad = asin(Input.get_accelerometer().x/GRAVITY)
	var angle_deg = angle_rad * (180/PI)
	get_parent().get_node("Label").set_text(str(round(angle_deg)))
#	print ("before: " + str(motion.x))
#	move(motion)
#	
#	if is_colliding():
#		var current_x = accel.x
#		motion.x = current_x
#		print ("after: " + str(motion.x))
#		motion.x = -motion.x
#		move(motion)

