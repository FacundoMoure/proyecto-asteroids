extends Node2D

func _ready() -> void:
	get_tree().paused = false
	$Pausa.visible = true
	$Pausa/ColorRect/GameOver.text = "Level 2"
	$Pausa/ColorRect/VBoxContainer.visible = false 
	$TransitionControl.visible = true
	$TransitionControl/AnimationPlayer.play("screen_transition")
	
	# Temporizador para desaparecer el texto
	var timer = get_tree().create_timer(4)
	await timer.timeout
	
	# Cambiar el texto a vacío
	$Pausa/ColorRect/GameOver.text = ""

	await $TransitionControl/AnimationPlayer.animation_finished
	$TransitionControl.visible = false

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
