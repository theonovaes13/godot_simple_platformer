extends Node2D

@export var value := 0
@export var digits := 4
@onready var label: Label = $coin/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = str("%04d" % GlobalVariables.coins_collected)
