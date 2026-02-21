extends Control

@onready var canvas_layer: CanvasLayer = $CanvasLayer

func _ready() -> void:
	canvas_layer.visible = false

func show_text():
	canvas_layer.visible = true
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://Scenes/UI/credits_screen.tscn")
