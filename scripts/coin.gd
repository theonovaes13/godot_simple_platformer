extends Node2D
@onready var coin: Area2D = $"."
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var coin_pickup_fx: AudioStreamPlayer = $coin_pickup_fx


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func coin_pickup() -> void:
	animation.set_animation('pickup_sfx')
	coin_pickup_fx.play()


func is_pickupable() -> bool:
	return animation.get_animation() == 'idle'

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if is_pickupable():
		if body.is_in_group('playerScene'):
			coin_pickup()
	
