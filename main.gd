extends Node2D


func _ready() -> void:
	
	get_tree().paused = false
	$Pausa.visible = false
	pass
	

func _process(delta: float) -> void:
	
	if Input.is_physical_key_pressed(KEY_ESCAPE):      
		get_tree().paused = true
		$Pausa.visible = true 
		pass
		
	if Global.naveDestruida:             #Si la nave fue destruida, perdiste!
		get_tree().paused = true
		Global.rejugar = true
		$Pausa.visible = true
		$Pausa/ColorRect/VBoxContainer/Label.visible = true 
		$Pausa/ColorRect/VBoxContainer/Jugar.visible = false
		$Pausa/ColorRect/VBoxContainer/Rejugar.visible = true 
	pass


func _on_pausa_jugar() -> void:
	get_tree().paused = false
	$Pausa.visible = false
	pass 

func _on_pausa_rejugar() -> void:
	get_tree().reload_current_scene()
	Global.naveDestruida = false
	#Global.rejugar = false   #Si dejo esta linea, va a volver a abrir el menu al comienzo.
	pass 
	
func _on_pausa_salir() -> void:
	pass # Replace with function body.
