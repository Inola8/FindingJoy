extends Node2D

@onready var quest_sign: Node2D = $"."

var inRange: bool = false

# Indicator if player is in range
func triggered():
	quest_sign.get_node("AnimatedSprite2D").play("interact")
	inRange = true

func idle():
	quest_sign.get_node("AnimatedSprite2D").play("default")
	inRange = false

# Call function when player interacts
func hide_sign():
	if (inRange):
		quest_sign.hide()
