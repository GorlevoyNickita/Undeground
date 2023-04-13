extends Spatial


export var count = 10 
export var timeout = 15

var timer = 0

func _ready():
	G.need_score += 1

func _physics_process(delta):
	if count <= 0:return
	timer += delta
	if timer > timeout:
		var h = G.skelet.instance()
		h.global_transform = $enemy.global_transform
		G.add(h)
		timer = 0
		count -= 1
