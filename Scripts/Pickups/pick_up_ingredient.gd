extends Pickup

@onready var cake_collector: Node2D = $"../../Inventory/CakeCollector"

func picked_up():
	cake_collector.add_ingredient()
	queue_free()
