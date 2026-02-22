extends Pickup

@onready var pickup_particle = preload("res://Scenes/Particles/pu_particle.tscn")

@export var rock_text: Texture2D

@onready var rock_collector: Node2D = $"../../Inventory/RockCollector"

func picked_up():
	rock_collector.add_rock()
	play_vfx()
	queue_free()

# VFX
func play_vfx():
	var vfx_instance = pickup_particle.instantiate()
	vfx_instance.global_position = global_position
	get_tree().current_scene.add_child(vfx_instance)
	vfx_instance.restart()
