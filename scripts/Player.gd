extends CharacterBody2D

const SPEED = 150.0
const JUMP_INITIAL_VELOCITY = -320.0
const VIEWPORT_SIZE = 2500

@onready var animation = $animation
@onready var jump_sound: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Get the animation sprite size to clamp the character's position.
var playerSize =  Vector2(32,32)
var leftBorder = 0 + playerSize.x / 2
var rightBorder = VIEWPORT_SIZE - playerSize.x / 2

func jump(delta):
		velocity.y = JUMP_INITIAL_VELOCITY
		if jump_sound.finished:
			jump_sound.play()
func hurt():
	animation.set_animation('hurt')
	
func _physics_process(delta):
	global_position.x = clamp(global_position.x, leftBorder, rightBorder)
	var jump_actions_pressed := Input.is_action_pressed("ui_accept") or Input.is_action_pressed("ui_up")
	var able_to_jump := jump_actions_pressed and is_on_floor()
	
	# Add the gravity.
	if !is_on_floor():
		velocity.y += gravity * delta
		animation.set_animation('jump')
	
	# Handle Jump.
	if able_to_jump:
		jump(delta)
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if !direction and !able_to_jump and is_on_floor():
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
	
