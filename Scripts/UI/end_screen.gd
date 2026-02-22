extends Control

#Anim
@onready var animated_sprite_start: AnimatedSprite2D = $CanvasLayer/MarginContainer/VBoxContainer/ButtonsVbox/StartButton/AnimatedSprite2D
@onready var animated_sprite_quit: AnimatedSprite2D = $CanvasLayer/MarginContainer/VBoxContainer/ButtonsVbox/QuitButton/AnimatedSprite2D

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/start_screen.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_start_button_mouse_entered() -> void:
	animated_sprite_start.play("hover")

func _on_start_button_mouse_exited() -> void:
	animated_sprite_start.play("default")

func _on_quit_button_mouse_entered() -> void:
	animated_sprite_quit.play("hover")
	
func _on_quit_button_mouse_exited() -> void:
	animated_sprite_quit.play("default")
