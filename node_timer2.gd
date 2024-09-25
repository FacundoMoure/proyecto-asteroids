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
	var timer = get_tree().create_timer(1)
	await timer.timeout
	get_tree().paused = true
	var timer2 = get_tree().create_timer(2)
	await timer2.timeout
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	pass # Replace with function body.
