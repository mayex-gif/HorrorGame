extends Node3D

@onready var anim_player = $AnimationPlayer

var puertas_abiertas = false
var llave_izq_abierta = false
var llave_der_abierta = false

func interactuar(parte: String):
	# Si el reproductor ya está haciendo una animación, ignoramos el click
	if anim_player.is_playing():
		return
		
	match parte:
		"mueble_cocina_mod_2":
			if not puertas_abiertas:
				anim_player.play("abrir_puertas")
				puertas_abiertas = true
			else:
				anim_player.play_backwards("abrir_puertas")
				puertas_abiertas = false
		
		"llave_izq":
			if not llave_izq_abierta:
				anim_player.play("abrir_llave_izq")
				llave_izq_abierta = true
			else:
				anim_player.play_backwards("abrir_llave_izq")
				llave_izq_abierta = false
					
		"llave_der":
			if not llave_der_abierta:
				anim_player.play("abrir_llave_der")
				llave_der_abierta = true
			else:
				anim_player.play_backwards("abrir_llave_der")
				llave_der_abierta = false
