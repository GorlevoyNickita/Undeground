extends KinematicBody

export var hp = 1

const VEL_SPEED = 0.4
const ROT_SPEED = 0.1
const GR_SPEED = 0.3
const BULLET = preload("res://object/enemy_bullet.tscn")

var vel = Vector3()
var timer = 0
var time_wait



func _ready():
	randomize()
	time_wait = 5 #5 + randi() % 20



func _physics_process(delta):
	var state = $AnimationPlayer.current_animation
	timer += delta
	if timer > 5:
		var bul = BULLET.instance()
		bul.global_transform = $bullet.global_transform
		G.add(bul)
		timer = 0
	if state != 'attack':
		if transform.origin.distance_to(G.player.transform.origin) < 10:
			set_state('attack')

	if state == 'idle':
		move(0)
		if timer > time_wait:
			set_state('move')

	elif state == 'move':
		move()
		if timer > time_wait:
			set_state('idle')

	elif state == 'attack':
		if transform.origin.distance_to(G.player.transform.origin) > 30:
			set_state('idle')
			return
		var a = Quat(transform.basis)
		var po = G.player.transform.origin
		po.y = transform.origin.y
		var b = Quat(transform.looking_at(po, Vector3.UP).basis)
		var c = a.slerp(b, 0.05) # find halfway point between a and b
		transform.basis = Basis(c)
		move(2)






func move(sc=1):
	var dir = Vector3()
	if sc:
		dir.z = -VEL_SPEED*sc
		dir = dir.rotated(Vector3.UP, rotation.y)
	vel.z = dir.z
	vel.x = dir.x
	vel.y -= GR_SPEED
	vel = move_and_slide(vel, Vector3.UP)



func set_state(s):
	if $AnimationPlayer.current_animation == s: return
	if s == 'move': $AnimationPlayer.playback_speed = 0.5
	else: $AnimationPlayer.playback_speed = 1
	$AnimationPlayer.play(s, 0.3)
	timer = 0

func on_bullet():
	hp -= 1
	if hp <= 0:
		G.score += 1
		queue_free()
	


