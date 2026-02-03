extends CharacterBody3D

# --- Constantes de Movimiento ---
const WALK_SPEED = 5.0
const JUMP_VELOCITY = 4.5
const CROUCH_SPEED = 2.5 

# --- Configuración de Agachado ---
@onready var camara = $Cabeza/Camera3D 
@onready var cabeza = $Cabeza
@onready var colision = $CollisionShape3D

const STAND_HEIGHT = 2.0
const CROUCH_HEIGHT = 0.75
const CAMERA_STAND_POS = 0.0
const CAMERA_CROUCH_POS = -0.5 
const CROUCH_LERP_SPEED = 10.0 

var is_crouching = false
var target_cam_pos = CAMERA_STAND_POS

var SENSITIVITY = 0.003

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta: float) -> void:
	# Lógica de Agachado
	if Input.is_action_just_pressed("agachar"): 
		is_crouching = !is_crouching
		if is_crouching:
			target_cam_pos = CAMERA_CROUCH_POS
			colision.shape.height = CROUCH_HEIGHT
		else:
			target_cam_pos = CAMERA_STAND_POS
			colision.shape.height = STAND_HEIGHT

	camara.position.y = lerp(camara.position.y, target_cam_pos, delta * CROUCH_LERP_SPEED)
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir := Input.get_vector("izquierda", "derecha", "adelante", "atras")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * WALK_SPEED
		velocity.z = direction.z * WALK_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, WALK_SPEED)
		velocity.z = move_toward(velocity.z, 0, WALK_SPEED)

	move_and_slide()

func _input(event):
	# Rotación libre de cámara sin chequeos de bloqueo
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * SENSITIVITY)
		cabeza.rotate_x(-event.relative.y * SENSITIVITY)
		cabeza.rotation.x = clamp(cabeza.rotation.x, deg_to_rad(-80), deg_to_rad(80))
