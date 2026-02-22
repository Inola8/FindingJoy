extends Node2D

@onready var happys_house: Node2D = $"../../HappysHouse"
@onready var npc_happy: Node2D = $"../../NPCs/Npc_Happy"
@onready var happy_spawn_point: Marker2D = $"../../HappysHouse/HappySpawnPoint"
@onready var fade_black: Control = $"../../BlackScreen/FadeBlack"

var player_in_range = null

var may_enter: bool = false

func _ready():
	# Reference to player
	var character_node = get_node('/root/Game/Player')
	character_node.interact.connect(_on_interact)

# Complete quest once Happy is home
func _on_area_2d_area_entered(_area: Area2D) -> void:
	var parent = _area.get_parent()
	if parent.is_in_group("happy"):
		npc_happy.finished_quest()
		may_enter = true

# Enter house
func _on_interact():
	if player_in_range and may_enter:
		fade_black.transition()
		await get_tree().create_timer(0.3).timeout
		player_in_range.velocity = Vector2.ZERO
		player_in_range.global_position = happy_spawn_point.global_position
		happys_house.play_audio.emit()

# For detecting player
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_in_range = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == player_in_range:
		player_in_range = null
