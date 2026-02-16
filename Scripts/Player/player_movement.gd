class_name Player extends CharacterBody2D

# Reference to sprite
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D;
@onready var cam: Camera2D = $Camera2D

var look_ahead_distance := 90.0
var target_offset_x := 0.0

# Interacton signal
signal interact();

# Movement variables
const SPEED = 120.0;
const JUMP_VELOCITY = -300.0;

# Update
func _process(_delta: float) -> void:
	# Emit signal for interaction
	if Input.is_action_just_pressed("interact"):
		interact.emit();

# Physics & movement
func _physics_process(delta: float) -> void:
	# Add the gravity
	if not is_on_floor():
		velocity += get_gravity() * delta;

	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY;

	# Get the input direction
	var direction := Input.get_axis("move_left", "move_right");
	
	# Flip sprite based on the direction
	if direction > 0:
		animated_sprite.flip_h = false;
		target_offset_x  = look_ahead_distance
	elif direction < 0:
		animated_sprite.flip_h = true;
		target_offset_x  = -look_ahead_distance
	
	# Move camera in direction
	cam.offset.x = lerp(cam.offset.x, target_offset_x, 2 * delta)
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle");
		else:
			animated_sprite.play("walk");
	else:
		animated_sprite.play("jump");
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED;
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED);

	# Velocity
	move_and_slide();
