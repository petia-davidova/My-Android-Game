extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var count = 0

func _ready():
	get_node("number").set_text(String(0))
	while count <= 10000:
		get_node("Timer").set_wait_time(5)
		get_node("Timer").start()
		#if get_node("Timer").set_wait_time(5.0):
		get_node("number").set_text(String(count))
		count+=1
