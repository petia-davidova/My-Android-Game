 extends KinematicBody2D

# variable for gravity - constant
const GRAVITY = 9.8
const WALK_SPEED = 400
var accel = Input.get_accelerometer()
#var motion = Vector2(5.6, -10)
var current_phone_angle = 0
#var current_ball_angle = atan(motion.y/motion.x) * (180/PI)
# variable for ball's velocity
var speed = 30.0
var velocity = Vector2()
var bounce_coeff = 1.0
var current_time

func _ready():
	velocity = Vector2(0, 10) * speed
	current_time = OS.get_unix_time()
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

#	move(motion)
#
#	var phone_angle = asin(Input.get_accelerometer().x/GRAVITY) * (180/PI)
#	get_parent().get_node("accel-label").set_text(str(round(phone_angle)))
#
#	var ball_angle = atan(motion.y/motion.x) * (180/PI)
#	get_parent().get_node("ball-angle-label").set_text(str((ball_angle)))
	
#	if is_colliding():
#		if motion.x > 0:
#			if phone_angle<=0:
#				var new_angle = 180 - (90 + current_phone_angle + current_ball_angle)
#				motion.x = tan((90-new_angle)/motion.y)
#				
#		motion.x = -motion.x
#		move(motion)
#	get_parent().get_node("walls").set_rot(-10)

	if(OS.get_unix_time() > (current_time + 5)):
		move(Vector2(10, -10))
		
	var motion = move(velocity * delta)
	
	if is_colliding():
		var n = get_collision_normal()
		motion = n.reflect(motion)
		bounce_coeff += 0.001
		velocity = n.reflect(velocity) * bounce_coeff
		
