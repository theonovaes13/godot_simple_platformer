extends Node

var score = 0
var coins_collected = 0
var hearts = 3

#handles damage and invulnerability after taking damage
var hurt_delay = 2
var invulnerability_timer = 2
var vulnerable = true

func _process(delta: float) -> void:
	invulnerability_timer += delta
	vulnerable = invulnerability_timer >= hurt_delay
