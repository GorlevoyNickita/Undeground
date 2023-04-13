extends Spatial


var angle = 0
export var need_key = ''
export var mess = ''

func _process(delta):
	$door_1.rotation.y = lerp($door_1.rotation.y, angle, delta * 10)
	
	
func open_close_1():
	if !need_key || (need_key && P.has(need_key)):
		if !angle:
			angle = deg2rad(-60)
			$action.queue_free()
			$action2.queue_free()
		else:
			angle = 0
	else:
		G.message(mess)

func open_close_2():
	if !need_key || (need_key && P.has(need_key)):
		if !angle:
			angle = deg2rad(60)
			$action.queue_free()
			$action2.queue_free()
		else:
			angle = 0
	else:
		G.message(mess)
