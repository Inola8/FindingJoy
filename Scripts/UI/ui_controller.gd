extends Node2D

@onready var fade_black: Control = $"../BlackScreen/FadeBlack"

func _ready() -> void:
	fade_black.fade_from_black()
