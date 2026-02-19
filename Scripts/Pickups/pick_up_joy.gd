extends Pickup

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var exclamation_mark: Sprite2D = $exclamation_mark

# Audio
@onready var sfx: AudioStreamPlayer2D = $sfx
@onready var sfx_call: AudioStreamPlayer2D = $sfx_call

@onready var camera_controller: Node = $"../../CameraController"

func _ready():
	super._ready()
	animated_sprite.flip_h = true
	sfx_call.play()

func _on_body_entered(_body: Node2D) -> void:
	super._on_body_entered(_body)
	exclamation_mark.visible = false
	
	# Anim
	animated_sprite.flip_h = false
	animated_sprite.play("scared")
	camera_controller.enable_joy_cam()
	sfx.play()
	
	await get_tree().create_timer(1.5).timeout
	camera_controller.enable_player_cam()
	queue_free()
