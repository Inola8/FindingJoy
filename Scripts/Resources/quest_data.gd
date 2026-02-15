class_name QuestData extends Resource

@export_group("Main data")
@export var id: String
@export var npc_id: String
@export var npc_sprite: Texture2D

@export_group("Dialogue")
@export var prompt_started: String
@export var prompt_ongoing: String
@export var prompt_finished: String

@export_group("Reward")
@export var reward: bool = false
