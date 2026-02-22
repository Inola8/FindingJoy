extends Node2D

signal play_audio()

@onready var happy_world_spawn_point: Marker2D = $"../Houses/Happys_House/HappyWorldSpawnPoint"
@onready var fade_black: Control = $"../BlackScreen/FadeBlack"
@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

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
		audio_stream_player.stop()
		fade_black.transition()
		await get_tree().create_timer(0.3).timeout
		player_in_range.velocity = Vector2.ZERO
		player_in_range.global_position = happy_world_spawn_point.global_position

func _on_play_audio() -> void:
	audio_stream_player.play()
