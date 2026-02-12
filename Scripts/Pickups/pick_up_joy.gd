extends Pickup

func picked_up():
	print(name)
	queue_free()
