extends Node2D

@onready var cattos_house: Node2D = $"../../CattosHouse"
@onready var catto_spawn_point: Marker2D = $"../../CattosHouse/CattoSpawnPoint"
@onready var fade_black: Control = $"../../BlackScreen/FadeBlack"

var player_in_range = null

func _ready():
	# Reference to player
	var character_node = get_node('/root/Game/Player')
	character_node.interact.connect(_on_interact)

# Enter house
func _on_interact():
	if player_in_range:
		fade_black.transition()
		await get_tree().create_timer(0.3).timeout
		player_in_range.velocity = Vector2.ZERO
		player_in_range.global_position = catto_spawn_point.global_position
		cattos_house.play_audio.emit()

# For detecting player
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_in_range = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == player_in_range:
		player_in_range = null
