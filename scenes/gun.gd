extends Spatial

const B = preload("res://object/gun_bullet.tscn")

var fire = false
var timer = 0

#func fire():
#	var b = B.instance()
#	b.global_transform = $b_start.global_transform
#	G.add(b)

func _physics_process(delta):
	if Input.is_action_just_pressed('ui_fire'):
		timer += delta
		if timer > 0.05:
			var bul = B.instance()
			bul.global_transform = $b_start.global_transform
			G.add(bul)
			timer = 0
