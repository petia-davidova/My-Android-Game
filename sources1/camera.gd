extends Camera2D

var camera_pos = self.get_pos()

func _ready():
#	pass
#	set_offset(get_viewport_rect().size / 2)
	set_fixed_process(true)
	print("initial cam pos: " + str(camera_pos))
	print("initial viewport: " + str(get_viewport_rect()))

func _fixed_process(delta):
	print(str(camera_pos))
	if camera_pos.y <= get_parent().get_node("ball").get_pos().y - get_viewport_rect().size.y + get_viewport_rect().size.y / 4:
		camera_pos.y = get_parent().get_node("ball").get_pos().y - get_viewport_rect().size.y + get_viewport_rect().size.y / 4
		print("iffffff")
	else:
		camera_pos.y = 2 + camera_pos.y + sqrt(camera_pos.y) * 4 * delta
		print("else")
	self.set_pos(camera_pos)

