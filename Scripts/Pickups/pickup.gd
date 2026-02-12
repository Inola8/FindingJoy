class_name Pickup extends Area2D

var inRange: bool = false

func _ready():
	# Reference to player
	var character_node = get_node('/root/Game/Player')
	character_node.interact.connect(_on_interact)

func _on_body_entered(_body: Node2D) -> void:
	inRange = true
	
func _on_body_exited(_body: Node2D) -> void:
	inRange = false

func _on_interact():
	if inRange:
		picked_up()

func picked_up():
	pass
