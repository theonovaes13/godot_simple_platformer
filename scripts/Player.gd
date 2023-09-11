extends CharacterBody2D

const SPEED = 150.0
const JUMP_INITIAL_VELOCITY = -320.0
const VIEWPORT_SIZE = 640
@onready var animation = $animation

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Get the animation sprite size to clamp the character's position.
var playerSize =  Vector2(32,32)
var leftBorder = 0 + playerSize.x / 2
var rightBorder = VIEWPORT_SIZE - playerSize.x / 2

func _physics_process(delta):
	global_position.x = clamp(global_position.x, leftBorder, rightBorder)
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	var jump = Input.is_action_just_pressed("ui_accept") and is_on_floor()
	if jump:
		velocity.y = JUMP_INITIAL_VELOCITY
		
	if !is_on_floor():
		animation.set_animation('jump')

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if !direction and !jump and is_on_floor():
		animation.set_animation('idle')
	
	if direction:
		animation.flip_h = true if direction < 0 else false
		velocity.x = direction * SPEED
		if is_on_floor():
			animation.set_animation('running')
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Move the character.	
	move_and_slide()
	
