extends Marker2D

var pre_ship = preload("res://ufo_shoot_L.tscn")
var timer = Timer.new()

func _ready() -> void:
	timer.timeout.connect(self._on_timer_timeout)
	timer.wait_time = 6.0
	timer.autostart = true
	add_child(timer)
	pass
	
func _on_timer_timeout()-> void:
	var ship = pre_ship.instantiate()
	get_parent().add_child(ship)
	pass
