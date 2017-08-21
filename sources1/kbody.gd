 extends KinematicBody2D

# variable for gravity - constant
const GRAVITY = 9.8
const WALK_SPEED = 400
var accel = Input.get_accelerometer()
var initial_motion = Vector2(18, -60)
var motion = Vector2(5.6, -10)
var current_phone_angle = 0
var current_ball_angle = atan(motion.y/motion.x) * (180/PI)
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

	move(motion)
#	current_ball_angle = 180 - (90 + current_phone_angle + 

#	var angle_rad = asin(Input.get_accelerometer().x/GRAVITY)
	var phone_angle = asin(Input.get_accelerometer().x/GRAVITY) * (180/PI)
	get_parent().get_node("accel-label").set_text(str(round(phone_angle)))
#	print ("before: " + str(motion.x))

	var ball_angle = atan(motion.y/motion.x) * (180/PI)
	get_parent().get_node("ball-angle-label").set_text(str((ball_angle)))
	
	if is_colliding():
#		if motion.x > 0:
#			if phone_angle<=0:
#				var new_angle = 180 - (90 + current_phone_angle + current_ball_angle)
#				motion.x = tan((90-new_angle)/motion.y)
#				
		motion.x = -motion.x
		move(motion)

