extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_Area2D_area_entered(area):
#	if area.is_in_group("player"):
#		get_tree().get_nodes_in_group("game")[0].siguienteEscena = "casa1"
#		get_tree().get_nodes_in_group("game")[0]._verificar_nivel()
#		get_tree().get_nodes_in_group("mundo")[0].queue_free()


func _on_pueblo_area_entered(area):
	pass # Replace with function body.
#	print("holaaa")
#	if area.is_in_group("player"):
#		get_tree().get_nodes_in_group("gameMain")[0].siguienteEscena = "mundo1"
#		get_tree().get_nodes_in_group("gameMain")[0].ubucacionSalir = Vector2(536,104)
#		get_tree().get_nodes_in_group("gameMain")[0]._verificar_nivel()
#		get_tree().get_nodes_in_group("gameMain")[0].queue_free()
