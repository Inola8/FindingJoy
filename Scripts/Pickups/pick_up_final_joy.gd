extends Pickup

func _on_body_entered(_body: Node2D) -> void:
	super._on_body_entered(_body)
	print("You found Joy")
	pass # Go to end scene
	
