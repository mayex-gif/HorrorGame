extends CharacterBody3D

# --- Constantes de Movimiento ---
const WALK_SPEED = 5.0
const CROUCH_SPEED = 2.5 
const JUMP_VELOCITY = 4.5

# --- Configuración de Agachado ---
@onready var camara = $Cabeza/Camera3D 
@onready var colision = $CollisionShape3D

const STAND_HEIGHT = 2.0
const CROUCH_HEIGHT = 0.75
const CAMERA_STAND_POS = 0.1
const CAMERA_CROUCH_POS = 0.1

const CROUCH_LERP_SPEED = 10.0 # Controla qué tan rápido se agacha (más alto = más rápido)
var is_crouching = false
var target_cam_pos = CAMERA_STAND_POS

func _physics_process(delta: float) -> void:
	# 1. Entrada de Agachado
	if Input.is_action_just_pressed("agachar"): 
		is_crouching = !is_crouching
		# Definimos a dónde queremos que llegue la cámara y la colisión
		if is_crouching:
			target_cam_pos = CAMERA_CROUCH_POS
			colision.shape.height = CROUCH_HEIGHT
		else:
			target_cam_pos = CAMERA_STAND_POS
			colision.shape.height = STAND_HEIGHT

	# 2. SUAVIZADO DE CÁMARA (Lerp)
	# Esto hace que la posición actual se acerque al objetivo gradualmente
	camara.position.y = lerp(camara.position.y, target_cam_pos, delta * CROUCH_LERP_SPEED)
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("izquierda", "derecha", "adelante", "atras")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * WALK_SPEED
		velocity.z = direction.z * WALK_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, WALK_SPEED)
		velocity.z = move_toward(velocity.z, 0, WALK_SPEED)

	move_and_slide()
