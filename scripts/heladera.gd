extends Node3D

@onready var anim_player = $AnimationPlayer

@export var on = false # Si ponés esto en 'true' en el inspector, empezará prendida
@export var luz: Node3D

var heladera_abierta = false
var freezer_abierto = false

func _ready():
	# Sincronizamos todo al arrancar el juego según el valor de 'on'
	actualizar_estado()

func actualizar_estado():
	if has_node("on") and has_node("off"):
		$on.visible = on
		$off.visible = !on
	
	# 2. Control de luces
	if luz:
		luz.get_node("freezer2").visible = on
	if luz:
		luz.get_node("heladera2").visible = on
		
func interactuar(parte: String): 
	on = !on
	if anim_player.is_playing():
		return
		
	match parte:
		"heladera", "freezer":
			_manejar_animaciones_simples(parte)

func _manejar_animaciones_simples(parte: String):
	if parte == "heladera":
		if not heladera_abierta:
			anim_player.play("heladera")
			heladera_abierta = true
		else:
			anim_player.play_backwards("heladera")
			heladera_abierta = false
			
	if parte == "freezer":
		if not freezer_abierto:
			anim_player.play("freezer")
			freezer_abierto = true
		else:
			anim_player.play_backwards("freezer")
			freezer_abierto = false
