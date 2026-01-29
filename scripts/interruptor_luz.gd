extends Node3D

@export var on = true # Si ponés esto en 'true' en el inspector, empezará prendida
@export var light_bulb: Node3D
@export var light_bulb_2: Node3D

func _ready():
	# Sincronizamos todo al arrancar el juego según el valor de 'on'
	actualizar_estado()

func interactuar(parte: String):
	on = !on
	actualizar_estado()

func actualizar_estado():
	# 1. Visual del interruptor
	if has_node("on") and has_node("off"):
		$on.visible = on
		$off.visible = !on
	
	# 2. Control de luces
	if light_bulb:
		light_bulb.get_node("OmniLight3D").visible = on
	if light_bulb_2:
		light_bulb_2.get_node("OmniLight3D").visible = on
		
	# 3. Animación (Opcional: solo si querés que la palanca se mueva al inicio)
	if has_node("AnimationPlayer"):
		if on:
			$AnimationPlayer.play("prender")
		else:
			$AnimationPlayer.play("apagar")
