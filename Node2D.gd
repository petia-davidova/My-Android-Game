extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var count = 0

func _ready():
	get_node("number").set_text(String(0))
	while count < 10000:
		count+=1
		if count % 10 == 0:
			get_node("number").set_text(String(count))
