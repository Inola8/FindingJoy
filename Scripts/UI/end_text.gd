extends Control

@onready var canvas_layer: CanvasLayer = $CanvasLayer

func _ready() -> void:
	canvas_layer.visible = false

func show_text():
	canvas_layer.visible = true
