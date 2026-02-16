extends Control

@onready var anim: AnimationPlayer = $AnimationPlayer

func transition():
	anim.play("fade_to_black")
	await anim.animation_finished
	anim.play("fade_from_black")

func end_screen():
	anim.play("fade_to_black")
