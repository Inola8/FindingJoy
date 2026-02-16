extends Node2D

@onready var npc_happy: Node2D = $"../../NPCs/Npc_Happy"
@onready var happy_spawn_point: Marker2D = $"../../HappysHouse/HappySpawnPoint"

var player_in_range = null

func _ready():
	# Reference to player
	var character_node = get_node('/root/Game/Player')
	character_node.interact.connect(_on_interact)

# Complete quest once Happy is home
func _on_area_2d_area_entered(_area: Area2D) -> void:
	var parent = _area.get_parent()
	if parent.is_in_group("happy"):
		npc_happy.finished_quest()

# Enter house
func _on_interact():
	if player_in_range:
		##################### Add fade to black
		player_in_range.velocity = Vector2.ZERO
		player_in_range.global_position = happy_spawn_point.global_position

# For detecting player
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_in_range = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == player_in_range:
		player_in_range = null
