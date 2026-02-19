class_name Pickup extends Area2D

@onready var pickup_sfx = preload("res://Scenes/Pickups/sfx_pick_up.tscn")

var inRange: bool = false

func _ready():
	# Reference to player
	var character_node = get_node('/root/Game/Player')
	character_node.interact.connect(_on_interact)

func _on_body_entered(_body: Node2D) -> void:
	inRange = true
	
func _on_body_exited(_body: Node2D) -> void:
	inRange = false

func play_sfx():
	var sfx_instance = pickup_sfx.instantiate()
	sfx_instance.global_position = global_position
	get_tree().current_scene.add_child(sfx_instance)
	sfx_instance.play()

func _on_interact():
	if inRange:
		picked_up()
		play_sfx()

func picked_up():
	pass
