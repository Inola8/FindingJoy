extends Pickup

@onready var quest_sign: Node2D = $QuestSign

func _ready():
	super._ready()
	quest_sign.finished()

func _on_body_entered(_body: Node2D) -> void:
	super._on_body_entered(_body)
	quest_sign.hide_sign()
	######## Add animation of joy getting scared
	await get_tree().create_timer(1.5).timeout
	queue_free()
