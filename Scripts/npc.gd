class_name Npc

extends Node2D

var inRange: bool = false;

# Quest
@export var quest_prompt: String;

# Reference to question mark
@onready var quest_sign: Node2D = $QuestSign;

func _ready():
	# Reference to player
	var character_node = get_node('/root/Game/Player')
	character_node.interact.connect(_on_interact)

# Indicator if player is in range
func _on_interaction_trigger_body_entered(_body: Node2D) -> void:
	quest_sign.get_node("AnimatedSprite2D").play("interact");
	inRange = true;

func _on_interaction_trigger_body_exited(_body: Node2D) -> void:
	quest_sign.get_node("AnimatedSprite2D").play("default");
	inRange = false;

# On interact remove question mark
func _on_interact():
	if (inRange):
		quest_sign.hide();
