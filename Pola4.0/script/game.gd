extends Node2D

@onready var GAME = $"."
@onready var animacion = $ColorRect/AnimationPlayer

var siguiente_nivel
var mundo1 = preload("res://Escenas/mundo.tscn").instantiate()
var casa = preload("res://Escenas/casa.tscn").instantiate()

func _ready():
	GAME.add_child(mundo1)
	
func _verificar_nivel():
	match siguiente_nivel:
		"casa":
			siguiente_nivel = casa
			GAME.remove_child(mundo1)
		"mundo":
			siguiente_nivel = mundo1
			GAME.remove_child(casa)

	animacion.play("saliendo")
	
	
func _siguiente_nivel():
	var nivel = siguiente_nivel
	GAME.add_child(nivel)

func _on_animation_player_animation_finished(anim_name):
	print(anim_name)	
	if anim_name == "saliendo":
		$ColorRect/AnimationPlayer.play("entrando")
	if anim_name == "entrando":
		_siguiente_nivel()
