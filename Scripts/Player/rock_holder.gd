extends Node2D

var rocks: int = 0

func add_rock():
	rocks += 1

func remove_rock():
	if rocks > 0:
		rocks -= 1
