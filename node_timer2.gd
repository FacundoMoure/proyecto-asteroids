extends Node

@onready var label = $Label
@onready var timer = $Timer

func _ready() -> void:
	await get_tree().create_timer(4).timeout
	timer.start()

func time_left_to_live():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60 
	return [minute, second]

func _process(delta: float) -> void:
	label.text = "Time: %02d:%02d" % time_left_to_live()
	
	
func _on_timer_timeout() -> void:

	$"../TransitionControl".visible = true
	$"../TransitionControl/AnimationPlayer".play_backwards("screen_transition")
	await $"../TransitionControl/AnimationPlayer".animation_finished
	get_tree().paused = true
	get_tree().change_scene_to_file("res://level_3.tscn")
	$"../TransitionControl".visible = false
	pass

	pass # Replace with function body.
