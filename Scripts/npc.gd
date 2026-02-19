class_name Npc extends Node2D

@onready var sfx_talk: AudioStreamPlayer2D = $sfx_talk

# Reference to question mark
@export var quest_sign: Node2D

# Quest data for the npc
@export var npc_quest: QuestData

# Bools
var inRange: bool = false
var has_started_quest: bool = false
var has_finished_quest: bool = false

func _ready():
	# Reference to player
	var character_node = get_node('/root/Game/Player')
	character_node.interact.connect(_on_interact)

func _on_interaction_trigger_body_entered(_body: Node2D) -> void:
	if not has_finished_quest:
		quest_sign.triggered()
	
	if not has_started_quest:
		quest_sign.play_alert_sfx()
	
	inRange = true
	
func _on_interaction_trigger_body_exited(_body: Node2D) -> void:
	if not has_finished_quest:
		quest_sign.idle()
		
	inRange = false
	QuestManager.hide_dialogue.emit()

func finished_quest():
	has_finished_quest = true
	quest_sign.finished()

# On interact remove question mark
func _on_interact():
	if not inRange:
		return
	
	quest_sign.hide_sign()
	show_dialogue()
	sfx_talk.play()

func show_dialogue():
	if has_finished_quest:
		QuestManager.complete_quest(npc_quest)

	if not has_started_quest:
		QuestManager.start_quest(npc_quest)
		has_started_quest = true
	else:
		QuestManager.remind_quest(npc_quest)
