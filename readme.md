El Sótano (Título Provisional) 🏚️
Proyecto de videojuego de terror psicológico con estética retro VHS, desarrollado en Godot Engine 4. Este proyecto enfoca su jugabilidad en la indefensión, el sigilo y la gestión de mecánicas de ruido bajo una atmósfera opresiva.

📝 Descripción del Proyecto
El jugador despierta atrapado en un sótano y debe encontrar la forma de escapar mientras es acechado por un secuestrador. La experiencia utiliza la psicología de Lo siniestro (Unheimlich) para transformar un entorno doméstico en un lugar de amenaza constante.

🚀 Características Técnicas e Implementación
🛠️ Sistema de Interacción Prolijo
Se implementó un sistema de interacción modular mediante RayCast3D que permite detectar piezas individuales de un modelo complejo:

Jerarquía Inteligente: El script de interacción busca hacia arriba en el árbol de nodos hasta encontrar el controlador del objeto.

Feedback Dinámico: La mira (crosshair) reacciona en tiempo real, cambiando de tamaño y color al detectar objetos interactuables.

Manejo de Estados: Control de animaciones independientes para múltiples partes (puertas, llaves de canilla, cajones) mediante un único AnimationPlayer.

🎨 Modelado y Animación 3D
Blender Workflow: Modelado modular de muebles de cocina y estructuras con optimización de mallas y aplicación de modificadores para exportación fluida.

Animación: Configuración de puntos de origen (pivots) estratégicos para movimientos realistas de rotación y traslación.

📼 Estética VHS y Atmósfera
Visuales: Diseño pensado para ser procesado por filtros de post-procesado que emulan cintas de video antiguas.

Mecánica de Sonido: Lógica de "Ruido" donde el entorno reacciona a las acciones del jugador. Implementación de una máscara de ruido global (truenos) que permite realizar acciones ruidosas de forma estratégica.

🏗️ Estructura del Guion
Acto 1: La Indefensión – Tutorial orgánico donde se aprende la interacción básica mientras se está limitado físicamente.

Acto 2: Recolección y Sigilo – Core gameplay basado en encontrar herramientas (destornillador, llaves, aceite) evitando alertar a la IA.

Acto 3: La Huida – Clímax de persecución activa hacia la salida principal.

🛠️ Tecnologías Utilizadas
Motor: Godot Engine 4.x (GDScript)

Modelado: Blender

Control de Versiones: Git

Cómo usar este repositorio
Clona el repositorio.

Abre el proyecto en Godot 4.x.

Explora la carpeta res://escenas/muebles/ para ver la implementación de los modelos .scn optimizados.

Desarrollado por: Mayex-gif