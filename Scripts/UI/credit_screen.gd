extends Node

@onready var animated_sprite_main: AnimatedSprite2D = $CanvasLayer/MarginContainer/VBoxContainer/ButtonsVbox/MainButton/AnimatedSprite2D
@onready var animated_sprite_quit: AnimatedSprite2D = $CanvasLayer/MarginContainer/VBoxContainer/ButtonsVbox/QuitButton/AnimatedSprite2D

func _on_main_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/start_screen.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_main_button_mouse_entered() -> void:
	animated_sprite_main.play("hover")

func _on_main_button_mouse_exited() -> void:
	animated_sprite_main.play("default")

func _on_quit_button_mouse_entered() -> void:
	animated_sprite_quit.play("hover")

func _on_quit_button_mouse_exited() -> void:
	animated_sprite_quit.play("default")
