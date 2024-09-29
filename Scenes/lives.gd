extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.lives=3
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.lives == 2:
		$live3.hide()
	if Global.lives == 1:
		$live2.hide()
	if Global.lives == 0:
		$live1.hide()

	pass
