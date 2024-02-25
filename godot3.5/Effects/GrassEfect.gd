extends Node2D

onready var animateSprite = $AnimatedSprite

func _ready():
	animateSprite.frame = 0	
	animateSprite.play("Animate")


func _on_AnimatedSprite_animation_finished():
	queue_free()
