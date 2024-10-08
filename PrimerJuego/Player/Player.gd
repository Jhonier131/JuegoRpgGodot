extends KinematicBody2D

export var ACCELERATION = 500
export var MAX_SPEED = 80
export var ROLL_SPEED = 120
export var FRICTION = 500

enum {
	MOVE,
	ROLL,
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN
var mover = true
var objeto = false

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var swordHitbox = $HitboxPivot/SwordHitbox

func _ready():
	animationTree.active = true
	swordHitbox.knockback_vector = roll_vector

func _physics_process(delta):
	print(state)
	match state:
		MOVE:
			move_state(delta)
		
		ROLL:
			roll_state()
		
		ATTACK:
			attack_state()
	
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if mover == true:
		if Input.is_action_just_pressed("estatuaMision"):
			if objeto == true:
				$Macro.visible = true
				Main.dialogo()
				$Macro/Control.ingresar_dialogo()
				mover = false
	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		swordHitbox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Roll/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move()
	
	if Input.is_action_just_pressed("Roll"):
		state = ROLL

	if Input.is_action_just_pressed("attack"):
		state = ATTACK
		
	if Input.is_action_just_pressed("ui_left"):
		$objetoEstatua/CollisionShape2D.rotation_degrees = 90

	if Input.is_action_just_pressed("ui_right"):
		$objetoEstatua/CollisionShape2D.rotation_degrees = 270

	if Input.is_action_just_pressed("ui_up"):
		$objetoEstatua/CollisionShape2D.rotation_degrees = 180

	if Input.is_action_just_pressed("ui_down"):
		$objetoEstatua/CollisionShape2D.rotation_degrees = 0

func roll_state():
	velocity = roll_vector * ROLL_SPEED
	animationState.travel("Roll")
	move()

func attack_state():
	velocity = Vector2.ZERO
	animationState.travel("Attack")

func move():
	velocity = move_and_slide(velocity)

func roll_animation_finished():
	velocity = velocity * 0.8
	state = MOVE

func attack_animation_finished():
	state = MOVE



func _on_objetoEstatua_area_entered(area):
	$Macro/Control/Label.text = str(area.name)
	if area.is_in_group("objeto"):
		Main.nombre_objeto = area.name
		objeto = true


func _on_objetoEstatua_area_exited(area):
	if area.is_in_group("objeto"):
		objeto = false
