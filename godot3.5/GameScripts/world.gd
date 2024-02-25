extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_casa1_area_entered(area):
	if area.is_in_group("player"):
		get_tree().get_nodes_in_group("mundo")[0].queue_free()
		print(get_tree().get_nodes_in_group("mundo"))
		get_tree().get_nodes_in_group("gameMain")[0].siguienteEscena = "casa1"
		get_tree().get_nodes_in_group("gameMain")[0]._verificar_nivel()
