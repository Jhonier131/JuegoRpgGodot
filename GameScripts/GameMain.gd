extends Node2D

onready var GAME = $"."
onready var animacion = $AnimationPlayer

var siguienteEscena
var nuevaEscena

var mundo1 = preload("res://world.tscn")
var casa1 = preload("res://World/scenes/casa1.tscn")
var ubucacionSalir = Vector2(536,104)

func _ready():
	var nivel = mundo1.instance()
	add_child(nivel)
#	GAME.add_child(mundo1)
	
func _verificar_nivel():
	match siguienteEscena:
		"casa1":
			nuevaEscena = casa1
		"mundo1":
			nuevaEscena = mundo1
	animacion.play("salirEscena")
	
func _siguiente_nivel():
	var nivel = nuevaEscena.instance()
	get_tree().get_nodes_in_group("gameMain")[0].call_deferred("add_child", nivel)
#	GAME.add_child(nivel)

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "salirEscena":
		animacion.play("entrarEscena")
	if anim_name == "entrarEscena":
		_siguiente_nivel()
		
