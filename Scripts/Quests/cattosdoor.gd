extends Node2D

@onready var world_spawn_point: Marker2D = $"../Houses/CattoHouse/WorldSpawnPoint"

var player_in_range = null

func _ready():
	# Reference to player
	var character_node = get_node('/root/Game/Player')
	character_node.interact.connect(_on_interact)

func _on_door_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_in_range = body

func _on_door_body_exited(body: Node2D) -> void:
	if body == player_in_range:
		player_in_range = null

func _on_interact():
	if player_in_range:
		##################### Add fade to black
		player_in_range.velocity = Vector2.ZERO
		player_in_range.global_position = world_spawn_point.global_position
