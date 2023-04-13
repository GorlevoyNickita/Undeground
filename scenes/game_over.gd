extends Control

func on_bullet():
		G.pause(0)
		queue_free()



func _on_exit_pressed():
	G.exit()
