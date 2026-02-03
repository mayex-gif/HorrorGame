extends Node3D

@onready var anim_player = $AnimationPlayer

var puertas_abiertas = false

func interactuar(parte: String):
	
	if anim_player.is_playing():
		return
			
	match parte:
		"puerta":
			if not puertas_abiertas:
				anim_player.play("abrir")
				puertas_abiertas = true
			else:
				anim_player.play_backwards("abrir")
				puertas_abiertas = false
