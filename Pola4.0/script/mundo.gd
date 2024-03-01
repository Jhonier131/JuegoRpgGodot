extends Node2D

func _ready():
	pass


func _on_casa_area_entered(area):
	if area.is_in_group("player"):
		get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "casa"
		get_tree().get_nodes_in_group("GAME")[0]._verificar_nivel()
	



func _on_area_2d_area_entered(area):
	global.tipoDialogo = "lapidaQuiz"
	DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "main");
	print("hola")
