class_name Npc extends Node2D

# Reference to question mark
@export var quest_sign: Node2D

# Quest data for the npc
@export var npc_quest: QuestData

var inRange: bool = false

func _ready():
	# Reference to player
	var character_node = get_node('/root/Game/Player')
	character_node.interact.connect(_on_interact)

func _on_interaction_trigger_body_entered(_body: Node2D) -> void:
	quest_sign.triggered()
	inRange = true
	
func _on_interaction_trigger_body_exited(_body: Node2D) -> void:
	quest_sign.idle()
	inRange = false
	QuestManager.hide_dialogue.emit()

# On interact remove question mark
func _on_interact():
	if not inRange:
		return
	
	quest_sign.hide_sign()
	
	if not QuestManager.has_started_quest:
		QuestManager.start_quest(npc_quest)
	else:
		QuestManager.remind_quest(npc_quest)
