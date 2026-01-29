extends Node3D

var abierto = false

func interactuar(parte: String):
	if $AnimationPlayer.current_animation != "abrir" and $AnimationPlayer.current_animation != "cerrar":
		abierto = !abierto
		if !abierto:
			$AnimationPlayer.play("cerrar")
		if abierto:
			$AnimationPlayer.play("abrir")
