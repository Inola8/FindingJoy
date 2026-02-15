extends Node2D

@onready var npc_happy: Node2D = $"../../NPCs/Npc_Happy"

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
	pass
