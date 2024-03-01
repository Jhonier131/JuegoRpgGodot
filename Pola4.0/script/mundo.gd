extends Node2D

func _ready():
	pass


func _on_casa_area_entered(area):
	if area.is_in_group("player") and global.puntaje_quiz1 == 2:
		get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "casa"
		get_tree().get_nodes_in_group("GAME")[0]._verificar_nivel()
	else:
		DialogueManager.show_example_dialogue_balloon(load("res://script/dialogos/faltaMision.dialogue"), "mision1");


func _on_area_2d_area_entered(area):
	print(global.puntaje_quiz1)
	if global.misio2Completada || global.puntaje_quiz1 < 1:
		global.tipoDialogo = "mundo"
	else:
		global.tipoDialogo = "lapidaQuiz"
		DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "main");
