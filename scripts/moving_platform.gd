extends Node2D

const WAIT_DURATION = 1.0

@onready var platform: AnimatableBody2D = $platform
@export var movement_duration := 2
@export var horizontal_distance := 192
@export var vertical_distance := 192
@export var horizontal_movement := true
@export var vertical_movement := true

var follow := Vector2.ZERO
var platform_center := 16
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_tween()

func start_tween():
	var x = horizontal_distance if horizontal_movement else 0
	var y = vertical_distance if vertical_movement else 0
	var tween = get_tree().create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	tween.tween_property(platform, "position", Vector2(x,y),movement_duration)
	tween.tween_property(platform, "position", Vector2.ZERO,movement_duration)

