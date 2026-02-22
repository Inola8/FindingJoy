extends Node

@onready var pickup_particle = preload("res://Scenes/Particles/pu_particle.tscn")

@onready var npc_linda: Npc = $"../../NPCs/Npc_Linda"

@onready var sfx: AudioStreamPlayer2D = $sfx

@onready var rocks = get_tree().get_nodes_in_group("rocks")
var index: int = 0

func _ready() -> void:
	for rock in rocks:
		set_rock_enabled(rock, false)

# Control visibility AND collider
func set_rock_enabled(rock: StaticBody2D, enabled: bool):
	rock.visible = enabled
	var collider = rock.get_node("CollisionShape2D")
	collider.disabled = not enabled

func create_bridge():
	if index < rocks.size():
		set_rock_enabled(rocks[index], true)
		play_vfx()
		
		index += 1
		sfx.play()
		finished_quest() # Check

func finished_quest():
	# Switch to completed state at some point
	if index > 8:
		npc_linda.finished_quest()

# VFX
func play_vfx():
	var vfx_instance = pickup_particle.instantiate()
	vfx_instance.global_position = rocks[index].global_position
	get_tree().current_scene.add_child(vfx_instance)
	vfx_instance.restart()
