extends Pickup

@export var rock_text: Texture2D

@onready var rock_collector: Node2D = $"../../Inventory/RockCollector"

func picked_up():
	rock_collector.add_rock()
	queue_free()
