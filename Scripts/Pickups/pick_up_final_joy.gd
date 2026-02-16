extends Pickup

@onready var fade_black: Control = $"../../BlackScreen/FadeBlack"

func _on_body_entered(_body: Node2D) -> void:
	super._on_body_entered(_body)
	fade_black.end_screen()
