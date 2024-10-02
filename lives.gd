extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.lives = 3
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.lives == 2:
		$live3.hide()
	if Global.lives == 1:
		$live2.hide()
	if Global.lives == 0:
		$live1.hide()
	update_lives_visual()
		
		
	
# Función para incrementar vidas si son menores a 3
func increase_lives() -> void:
	if Global.lives < 3:
		Global.lives += 1
		update_lives_visual()

# Función para actualizar el estado visual de las vidas
func update_lives_visual() -> void:
	# Esconder todas las vidas inicialmente para que no queden visibles por error
	$live1.hide()
	$live2.hide()
	$live3.hide()
	
	# Mostrar las vidas según el número actual
	if Global.lives >= 1:
		$live1.show()
	if Global.lives >= 2:
		$live2.show()
	if Global.lives >= 3:
		$live3.show()
	pass
