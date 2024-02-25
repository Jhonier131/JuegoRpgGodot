extends Node

var nombre_objeto

var dialogo_objeto = []

func dialogo():
	match nombre_objeto:
		"objetoEstatua":
			dialogo_objeto = [
				"Esta cerrado ...",
				"Talvez tengo que cumplir otra mision antes",
				"Regresa despues"
			]
