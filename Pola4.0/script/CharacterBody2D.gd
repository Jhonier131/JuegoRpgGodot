extends CharacterBody2D


const velocidad = 150.0
@onready var player = $".."
@onready var animacion = $AnimatedSprite2D

func _physics_process(_delta):
	
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
	
	move_and_slide()
