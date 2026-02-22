extends CanvasLayer

@onready var moving_holder: Node2D = $MovingHolder
@onready var show_cats_holder: Node2D = $ShowCatsHolder
@onready var timer: Timer = $ShowCatsHolder/Timer

@onready var fade_black: Control = $"../FadeBlack"

@onready var cats = get_tree().get_nodes_in_group("credit_cats")
var index: int = 0
var canMove: bool = true

func _ready() -> void:
	fade_black.fade_from_black()

	# Disable everything
	for cat in cats:
		cat.visible = false

# Move text up
func _process(delta: float) -> void:
	if canMove:
		move_text_up(delta)

func move_text_up(speed: float):
	await get_tree().create_timer(2).timeout
	moving_holder.position.y -= 50 * speed #25
		
	if moving_holder.position.y <= -1300:
		canMove = false
		trigger_timer()

func trigger_timer():
	cats[index].visible = true
	timer.start()

# Show cats one for one
func _on_timer_timeout():
	cats[index].visible = false
	fade_black.fade_from_black()
	
	index += 1
	
	if index >= cats.size():
		timer.stop()
		get_tree().change_scene_to_file("res://Scenes/UI/end_screen.tscn")
		return
		
	cats[index].visible = true
