extends RayCast3D

@onready var crosshair_panel = $"../../CanvasLayer/CenterContainer/MiraAnchor/Panel"

func _physics_process(_delta: float) -> void:
	# Verificamos que el panel exista para evitar errores
	if not crosshair_panel: return
	
	var style_box = crosshair_panel.get_theme_stylebox("panel") as StyleBoxFlat
	
	if is_colliding():
		var hit = get_collider()
		var interactuable = false
		
		# Buscamos el script de interacción en la jerarquía
		var obj = hit
		while obj != null:
			if obj.has_method("interactuar"):
				interactuable = true
				break
			obj = obj.get_parent()
		
		# Cambiamos la mira según si es interactuable o no
		if interactuable:
			style_box.bg_color = Color.WHITE
			crosshair_panel.scale = Vector2(1, 1)
		else:
			style_box.bg_color = Color.LIGHT_GRAY
			crosshair_panel.scale = Vector2(1.0, 1.0)
			
		# Ejecutamos la acción al presionar la tecla
		if Input.is_action_just_pressed("interactuar") and interactuable:
			var target = hit
			while target != null:
				if target.has_method("interactuar"):
					target.interactuar(hit.name)
					break
				target = target.get_parent()
	else:
		# Si no hay colisión, resetear mira
		style_box.bg_color = Color.WHITE
		crosshair_panel.scale = Vector2(1.0, 1.0)
