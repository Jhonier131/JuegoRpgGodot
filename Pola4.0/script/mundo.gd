extends Node2D

func _ready():
	pass


func _on_casa_area_entered(area):
	if area.is_in_group("player"):
		get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "casa"
		get_tree().get_nodes_in_group("GAME")[0]._verificar_nivel()
	
