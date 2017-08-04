extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var count = 0

func _ready():
	while count < 100:
		count+=1
		number.set_text(count)
