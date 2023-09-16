extends Node2D

@onready var heart_1: AnimatedSprite2D = $heart
@onready var heart_2: AnimatedSprite2D = $heart2
@onready var heart_3: AnimatedSprite2D = $heart3


func _process(_delta: float) -> void:
	var hearts = GlobalVariables.hearts
	heart_1.frame = 0 if hearts >= 1 else 1
	heart_2.frame = 0 if hearts >= 2 else 1
	heart_3.frame = 0 if hearts >= 3 else 1
	


