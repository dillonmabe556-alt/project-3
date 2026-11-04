extends CharacterBody2D

@onready var ray_cast_2d: RayCast2D = $RayCast2D
const SPEED = 100.0

# 1 = Right, -1 = Left
var direction: int = 1

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add gravity so the enemy falls onto platforms
	if not is_on_floor():
		velocity.y += gravity * delta

	# Turn around if hitting a wall OR if about to fall off a ledge
	if is_on_wall() or (is_on_floor() and not ray_cast_2d.is_colliding() and velocity.x != 0):
		direction = -direction
		
		# Move the raycast to the correct distance in front of the enemy
		ray_cast_2d.target_position.x = 60 * direction
		
		ray_cast_2d.force_raycast_update()
	# Move the enemy horizontally
	velocity.x = direction * SPEED

	# Flip the sprite visually based on direction
	# If moving left (-1), flip_h is true. If moving right (1), flip_h is false.
	animated_sprite.flip_h = (direction < 0)

	move_and_slide()
