extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
const SPEED = 400.0
const JUMP_VELOCITY = -700.0
func teleport_to(target_pos: Vector2) -> void:
	PhysicsServer2D.body_set_state(
		get_rid(), 
		PhysicsServer2D.BODY_STATE_TRANSFORM, 
		Transform2D(0, target_pos)
	)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	if direction != 0:
		velocity.x = direction * SPEED
		
		# 4. Flip the sprite based on direction
		# If direction is -1 (left), flip_h becomes true. If 1 (right), it becomes false.
		animated_sprite.flip_h = (direction < 0)
	else:
		# Smooth deceleration when no input is pressed
		velocity.x = move_toward(velocity.x, 0, SPEED)

	


	move_and_slide()
