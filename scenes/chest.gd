extends Node2D
@onready var animation: AnimatedSprite2D = $animation
# Called when the node enters the scene tree for the first time.
var has_been_collected := false

func _on_collision_area_body_entered(body: Node2D) -> void:
	collect_trophy()

func collect_trophy():
	if has_been_collected:
		return
	animation.play("default")
	GlobalVariables.score += 500
	has_been_collected = true
