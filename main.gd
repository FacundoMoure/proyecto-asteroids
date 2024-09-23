extends Node2D


func _ready() -> void:
	get_tree().paused = false
	$Pausa.visible = false
	Global.score = 0
	pass

func _process(delta: float) -> void:
	
	if Global.naveDestruida:             #Si la nave fue destruida, perdiste!
		get_tree().paused = true
		Global.rejugar = true
		Global.score = 0
		$Pausa.visible = true
		$Pausa/ColorRect/GameOver.visible = true
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
	Global.score = 0
	Global.naveDestruida = false
	#Global.rejugar = false   #Si dejo esta linea, va a volver a abrir el menu al comienzo.
	pass 
	
func _on_pausa_salir() -> void:
	pass # Replace with function body.
