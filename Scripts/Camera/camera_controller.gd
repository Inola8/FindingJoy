extends Node

@onready var player_camera: Camera2D = $"../Player/Camera2D"
@onready var joy_camera: Camera2D = $"../PickUps/PickUp_Joy/JoyCamera2D"

func enable_player_cam():
	joy_camera.enabled = false
	player_camera.enabled = true

func enable_joy_cam():
	player_camera.enabled = false
	joy_camera.enabled = true
