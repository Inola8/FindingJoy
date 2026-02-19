extends Area2D

@onready var sfx_water: AudioStreamPlayer2D = $sfx_water

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		sfx_water.play()
