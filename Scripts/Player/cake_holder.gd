extends Node2D

@onready var Cake = preload("res://Scenes/Pickups/pick_up_cake.tscn")

@onready var npc_catto: Npc = $"../../NPCs/Npc_Catto"

signal can_bake_cake()

var ingredients: int = 0

# Count ingredients
func add_ingredient():
	ingredients += 1
	
	if ingredients >= 3:
		can_bake_cake.emit()

func spawn_cake():
	var cake = Cake.instantiate()
	cake.position = position
	get_parent().add_child(cake)
	
	npc_catto.finished_quest()
