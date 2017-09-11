extends Camera2D

var camera_pos = self.get_pos()

func _ready():
	set_offset(get_viewport_rect().size / 2)
	set_fixed_process(true)

func _fixed_process(delta):

	if camera_pos.y <= get_parent().get_node("ball").get_pos().y - get_viewport_rect().size.y + get_viewport_rect().size.y / 4:
		camera_pos.y = get_parent().get_node("ball").get_pos().y - get_viewport_rect().size.y + get_viewport_rect().size.y / 4
	else:
		camera_pos.y = 2 + camera_pos.y + sqrt(camera_pos.y) * 2 * delta
	self.set_pos(camera_pos)

