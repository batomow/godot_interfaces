extends Node2D

@export var interfaces: Array[Script] = []

func _process(delta):
	global_position = get_global_mouse_position()
	pass

func do_stuff():
	print("im doing stuff!")

#func take_damage(amount:float): 
#	print("taking {0} damage!".format([amount]))
