extends KinematicBody2D

# variable for gravity - constant
const GRAVITY = 9.8
const WALK_SPEED = 400
var last_phone_angle
var ball_angle = 12
#var current_ball_angle = atan(motion.y/motion.x) * (180/PI)
# variable for ball's velocity
var speed = 50.0
var velocity = Vector2()
var bounce_coeff = 1.0


func _ready():
	velocity = Vector2(10, -10) * speed
	last_phone_angle = get_phone_angle()
	set_fixed_process(true)
	
func _fixed_process(delta):
	var motion = move(velocity * delta)
	
	var current_phone_angle = get_phone_angle()
	if (current_phone_angle != last_phone_angle || 1 == 1):
		var magnitude = sqrt((velocity.x * velocity.x) + (velocity.y*velocity.y))
		if (velocity.x != 0):
			ball_angle = atan(velocity.y/velocity.x)
		else:
			if (velocity.y > 0):
				ball_angle = -PI/2
			else:
				ball_angle = PI/2
		ball_angle = ball_angle - (current_phone_angle - last_phone_angle)
		var new_x = magnitude * cos(ball_angle)
		var new_y = magnitude * sin(ball_angle)
		velocity = Vector2(new_x, new_y)
		last_phone_angle = current_phone_angle
		
	get_parent().get_node("ball-angle-label").set_text("b: " + str((ball_angle)))
	get_parent().get_node("accel-label").set_text("ph: " + str(round(current_phone_angle * 180/PI)))
	
	if is_colliding():
		var n = get_collision_normal()
		print("x: " + str(n.x) + " y: " + str(n.y))
		print("x = " + str(sqrt(((n.x*n.x)+(n.y*n.y)))*cos(15)))
		motion = n.reflect(motion)
		bounce_coeff += 0.001
		velocity = n.reflect(velocity) * bounce_coeff
		
func get_phone_angle():
	var accel = Input.get_accelerometer()
	var angle = acos(-accel.y/GRAVITY)
	if (accel.x < 0):
		angle = 0-angle
	return angle

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
	
#	if is_colliding():
#		if motion.x > 0:
#			if phone_angle<=0:
#				var new_angle = 180 - (90 + current_phone_angle + current_ball_angle)
#				motion.x = tan((90-new_angle)/motion.y)
#				
#		motion.x = -motion.x
#		move(motion)
#	get_parent().get_node("walls").set_rot(-10)

#	if(OS.get_unix_time() > (current_time + 5)):
#		move(Vector2(10, -10))