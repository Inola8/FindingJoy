extends Node2D

@onready var quest_sign: Node2D = $"."
# sfx
@onready var sfx_alert: AudioStreamPlayer2D = $sfx_alert
@onready var sfx_completed: AudioStreamPlayer2D = $sfx_completed

var inRange: bool = false

# Indicator if player is in range
func triggered():
	quest_sign.get_node("AnimatedSprite2D").play("interact")
	inRange = true

func play_alert_sfx():
	sfx_alert.play()

func idle():
	quest_sign.get_node("AnimatedSprite2D").play("default")
	inRange = false
	
func finished():
	quest_sign.show()
	quest_sign.get_node("AnimatedSprite2D").play("finished")
	inRange = true
	sfx_completed.play()

# Call function when player interacts
func hide_sign():
	if (inRange):
		quest_sign.hide()
