extends Pickup

@onready var quest_sign: Node2D = $QuestSign
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@onready var camera_controller: Node = $"../../CameraController"

func _ready():
	super._ready()
	animated_sprite.flip_h = true
	quest_sign.finished()

func _on_body_entered(_body: Node2D) -> void:
	super._on_body_entered(_body)
	quest_sign.hide_sign()
	
	# Anim
	animated_sprite.flip_h = false
	animated_sprite.play("scared")
	camera_controller.enable_joy_cam()
	
	await get_tree().create_timer(1.5).timeout
	camera_controller.enable_player_cam()
	queue_free()
