extends Node

@onready var label = $Label
@onready var timer = $Timer

func _ready() -> void:
	timer.start()

func time_left_to_live():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60 
	return [minute, second]

func _process(delta: float) -> void:
	label.text = "Time: %02d:%02d" % time_left_to_live()
	
	
func _on_timer_timeout() -> void:

	$Transi/TransitionControl.visible = true
	$Transi/TransitionControl/AnimationPlayer.play_backwards("screen_transition")
	await $Transi/TransitionControl/AnimationPlayer.animation_finished

	get_tree().paused = true
	var timer = get_tree().create_timer(1)
	await timer.timeout
	get_tree().change_scene_to_file("res://level_2.tscn")
	$Transi/TransitionControl.visible = false
	pass
	#var timer2 = get_tree().create_timer(2)
	#await timer2.timeout
	

	pass # Replace with function body.
