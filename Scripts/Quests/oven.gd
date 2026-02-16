extends Node2D

@onready var cake_collector: Node2D = $"../../Inventory/CakeCollector"

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var light: PointLight2D = $PointLight2D

# Bools
var inRange: bool = false
var canBake: bool = false
var isBaking: bool = false

func _ready():
	# Reference to player
	var character_node = get_node('/root/Game/Player')
	character_node.interact.connect(_on_interact)
	cake_collector.can_bake_cake.connect(_on_can_bake_cake)
	
# Player detection
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		inRange = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		inRange = false

func _on_can_bake_cake():
	canBake = true

# Turn oven on if player has all ingredients
func _on_interact():
	if inRange and canBake:
		if not isBaking:
			isBaking = true
			animated_sprite.play("on")
			light.enabled = true
			
			# Wait while baking
			await get_tree().create_timer(5).timeout
			cake_collector.spawn_cake()
			animated_sprite.play("off")
			light.enabled = false
