extends Area2D

var inRange: bool = false

@onready var rock_collector: Node2D = $"../Inventory/RockCollector"
@onready var rock_bridge: Node2D = $"../RockBridge"

func _ready():
	# Reference to player
	var character_node = get_node('/root/Game/Player')
	character_node.interact.connect(_on_interact)

func _on_body_entered(_body: Node2D) -> void:
	inRange = true

func _on_body_exited(_body: Node2D) -> void:
	inRange = false
	
func _on_interact():
	if inRange and rock_collector.rocks > 0:
		rock_collector.remove_rock()
		rock_bridge.create_bridge()
