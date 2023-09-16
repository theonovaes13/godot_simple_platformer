extends Node2D

@onready var area_0: Area2D = $AnimatedSprite2D/Area2D
@onready var area_1: Area2D = $AnimatedSprite2D3/Area2D
@onready var area_2: Area2D = $AnimatedSprite2D4/Area2D
@onready var area_3: Area2D = $AnimatedSprite2D5/Area2D
@onready var player: CharacterBody2D = $"../Player"
var elapsed_time := 0.0

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("playerScene"):
		if GlobalVariables.vulnerable:
			GlobalVariables.hearts -= 1
			GlobalVariables.invulnerability_timer = 0
			player.hurt()
		if GlobalVariables.hearts <= 0:
			get_tree().quit()
