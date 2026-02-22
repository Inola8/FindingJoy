extends Npc

const SPEED: float = 15 #15

# Bools
var direction: float = 1
var canWalk: bool = false
var joyIsClose: bool = false

# Happy will start walking to her house
func _process(_delta) -> void:
	if canWalk and joyIsClose and not has_finished_quest:
		position.x += direction * SPEED * _delta
		animated_sprite.play("walk")
		animated_sprite.flip_h = true
	else:
		animated_sprite.play("idle")
		animated_sprite.flip_h = false

# Can move if player is closeby
func _on_interaction_trigger_body_entered(_body: Node2D) -> void:
	super._on_interaction_trigger_body_entered(_body) 
	joyIsClose = true
	
func _on_interaction_trigger_body_exited(_body: Node2D) -> void:
	super._on_interaction_trigger_body_exited(_body)
	joyIsClose = false

func _on_interact():
	super._on_interact()
	if has_started_quest:
		await get_tree().create_timer(1.3).timeout
		canWalk = true
