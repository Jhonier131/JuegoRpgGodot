extends Node

var movimientoPersonaje = true;
var tipoDialogo = "mundo"

var mision1Activa = false
var misio1Completada = false;

var misio2Completada = false;
var puntaje_quiz1 = 0;

func _ocultar_espada():
	print("eliminar espada")
	get_tree().get_nodes_in_group("espada")[0].visible = false
	
