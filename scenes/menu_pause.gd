extends Control

func _process(delta):
	if Input.is_action_just_pressed('ui_pause'):
		G.pause(0)
		queue_free()


func _on_next_pressed():
	G.pause(0)
	queue_free()


func _on_exit_pressed():
	G.exit()
