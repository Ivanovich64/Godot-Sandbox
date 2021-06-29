extends KinematicBody2D

const MAX_SPEED = 80
const ACCELERATION = 500
const FRICTION = 600


var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer



#func _ready():	
			#Se ejecuta cuando el nodo está listo y cargado
#	pass

func _physics_process(delta):
			#Se ejecuta constantemente si el nodo está en proceso
#	print("Hello RPG")
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") -Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") -Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	
	if input_vector != Vector2.ZERO:
		if input_vector.x > 0:
			animationPlayer.play("RunRight")
		else:
			animationPlayer.play("RunLeft")
		velocity = velocity.move_toward(input_vector * MAX_SPEED,  ACCELERATION * delta)
	
	else:
		animationPlayer.play("IdleRight")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	velocity = move_and_slide(velocity)
	
