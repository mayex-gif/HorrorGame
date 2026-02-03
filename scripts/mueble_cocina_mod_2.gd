extends Node3D

@onready var anim_player = $AnimationPlayer
@onready var canilla_pivot = $canilla

var puertas_abiertas = false
var llave_izq_abierta = false
var llave_der_abierta = false

func interactuar(parte: String): 
	if anim_player.is_playing():
		return
		
	match parte:
		"puerta", "llave_izq", "llave_der":
			_manejar_animaciones_simples(parte)
			
		"canilla_body":
			# Por ahora no hace nada, o podés poner un print
			print("Tocaste la canilla (Sin rotación manual)")

# No hay función _input aquí para evitar conflictos con la cámara

func _manejar_animaciones_simples(parte: String):
	if parte == "puerta":
		if not puertas_abiertas:
			anim_player.play("abrir_puertas")
			puertas_abiertas = true
		else:
			anim_player.play_backwards("abrir_puertas")
			puertas_abiertas = false
			
	if parte == "llave_izq":
		if not llave_izq_abierta:
			anim_player.play("abrir_llave_izq")
			llave_izq_abierta = true
		else:
			anim_player.play_backwards("abrir_llave_izq")
			llave_izq_abierta = false
			
	if parte == "llave_der":
		if not llave_der_abierta:
			anim_player.play("abrir_llave_der")
			llave_der_abierta = true
		else:
			anim_player.play_backwards("abrir_llave_der")
			llave_der_abierta = false
