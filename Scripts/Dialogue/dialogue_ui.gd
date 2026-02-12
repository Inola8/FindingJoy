class_name DialogueUI extends Control

# Panels
@onready var text_panel: Panel = $CanvasLayer/TextPanel
@onready var image_panel: Panel = $CanvasLayer/ImagePanel

# Adjustable content
@onready var npc_name: Label = $CanvasLayer/ImagePanel/NPCName
@onready var npc_image: Sprite2D = $CanvasLayer/ImagePanel/NPCImage
@onready var dialogue_text: Label = $CanvasLayer/TextPanel/DialogueBox/DialogueText

func _ready():
	# Start hidden
	hide_dialogue()
	# Connect the event
	QuestManager.show_dialogue.connect(on_show_dialogue)
	QuestManager.hide_dialogue.connect(on_hide_dialogue)

# Show and hide functions
func show_dialogue():
	text_panel.visible = true
	image_panel.visible = true
	
func hide_dialogue():
	text_panel.visible = false
	image_panel.visible = false

# Connected data
func on_show_dialogue(npc_id: String, npc_sprite: Texture2D, text_box: String):
	npc_name.text = npc_id
	npc_image.texture = npc_sprite
	dialogue_text.text = text_box
	
	show_dialogue()

func on_hide_dialogue():
	hide_dialogue()
