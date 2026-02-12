extends Node2D

# Quest box
@export var DialogueUi: DialogueUI

signal show_dialogue(npc_id: String, npc_img: Texture2D, text: String)
signal hide_dialogue()

# Store quests here
var active_quests: Dictionary = {}
var has_started_quest = false

func start_quest(data: QuestData) -> void:

	# Make an instance of the quest and add it to the stored quests
	var quest := Quest.new(data)
	quest.state = Quest.State.started
	active_quests[data.id] = quest

	# Show dialogue when starting a new quest
	show_dialogue.emit(data.npc_id, data.npc_sprite, data.prompt_started)
	has_started_quest = true

# Show some text when quest is not completed yet
func remind_quest(data: QuestData) -> void:
	show_dialogue.emit(data.npc_id, data.npc_sprite, data.prompt_ongoing)

func complete_quest(data: QuestData) -> void:
	# Set the quest to completed and show the correct text
	active_quests[data.id].state = Quest.State.completed
	show_dialogue.emit(data.npc_id, data.npc_sprite, data.prompt_finished)
