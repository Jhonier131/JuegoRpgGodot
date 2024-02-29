extends CharacterBody2D

const velocidad = 150.0
@onready var player = $".."
@onready var animacion = $AnimatedSprite2D

var rangoObj = false

func _physics_process(_delta):
	
	#print(global.movimientoPersonaje)
	#print(global.tipoDialogo)
	player_move(_delta)
	
	if rangoObj:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "main");
			return
		
	move_and_slide()
	
func player_move(_delta):
	if global.movimientoPersonaje:
		if Input.is_action_pressed("abajo"):
			player.position.y += velocidad * _delta
			animacion.play("down")
		elif  Input.is_action_pressed("derecha"):
			player.position.x += velocidad * _delta
			animacion.play("right")
		elif Input.is_action_pressed("izquierda"):
			player.position.x -= velocidad * _delta
			animacion.play("left")
		elif  Input.is_action_pressed("arriba"):
			player.position.y -= velocidad * _delta
			animacion.play("up")
		else:
			animacion.stop()


func _on_deteccion_body_entered(body):
	if body.has_method("soldado1"):
		rangoObj = true
		global.tipoDialogo = "soldado1"
		
	if body.has_method("estatua1"):
		rangoObj = true
		global.tipoDialogo = "estatua1"
		animacion.play("quieto")
		DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "main");
		
	if body.name == "cofre" and !global.misio1Completada:
		global.misio1Completada = true

func _on_deteccion_body_exited(body):
	rangoObj = false
	global.tipoDialogo = "mundo"
		
	
