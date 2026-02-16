extends Pickup

@onready var fade_black: Control = $"../../BlackScreen/FadeBlack"
@onready var end_text: Control = $"../../BlackScreen/EndText"

func _on_body_entered(_body: Node2D) -> void:
	super._on_body_entered(_body)
	fade_black.end_screen()
	await get_tree().create_timer(1).timeout
	end_text.show_text()
