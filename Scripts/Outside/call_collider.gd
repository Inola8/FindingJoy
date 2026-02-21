extends Area2D

@onready var sfx_call: AudioStreamPlayer2D = $sfx_call

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		sfx_call.play()
		await get_tree().create_timer(0.7).timeout
		queue_free()
