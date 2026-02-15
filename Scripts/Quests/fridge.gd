extends Node2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@onready var Butter = preload("res://Scenes/Pickups/pick_up_butter.tscn")

var inRange: bool = false
var isOpen: bool = false
var hasSpawnedButter: bool = false

func _ready():
	# Reference to player
	var character_node = get_node('/root/Game/Player')
	character_node.interact.connect(_on_interact)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		inRange = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		inRange = false

func _on_interact():
	if inRange:
		if not isOpen:
			isOpen = true
			animated_sprite.play("open")
			spawn_butter()
		else:
			isOpen = false
			animated_sprite.play("default")

func spawn_butter():
	if not hasSpawnedButter:
		hasSpawnedButter = true
		var butter = Butter.instantiate()
		butter.position = position
		get_parent().add_child(butter)
