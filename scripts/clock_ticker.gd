extends Timer

func _on_timeout():
	GameEventBus.emit_signal("time_advanced")
