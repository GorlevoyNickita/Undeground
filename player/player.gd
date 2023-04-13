extends KinematicBody

export var SPEED_TURN = 0.01
export var SPEED_MOVE = 5
export var SPEED_FALL = 0.5
export var SPEED_JUMP = 10


var vel = Vector3()
var cast = null
var pack_item=null



func _physics_process(delta):
	vel.x = 0
	vel.z = 0
	cast = null
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_pressed("ui_left"):
		vel.x = -SPEED_MOVE
	if Input.is_action_pressed("ui_right"):
		vel.x = SPEED_MOVE
	if Input.is_action_pressed("ui_up"):
		vel.z = -SPEED_MOVE
	if Input.is_action_pressed("ui_down"):
		vel.z = SPEED_MOVE
	if Input.is_action_just_pressed("ui_jump"):
		if is_on_floor():
			vel.y = SPEED_JUMP
	
	if vel.x || vel.z:
		vel = vel.rotated(Vector3.UP, rotation.y)
	
	vel.y -= SPEED_FALL
	vel = move_and_slide(vel, Vector3.UP,true, 4,0.8,false)
	
	if $head/detector.is_colliding():
		cast = $head/detector.get_collider()
		if 'type' in cast:
			if cast.type != 'action':
				cast = null
		else:
			cast = null
	if cast:
		G.gui.alert(cast.label)
	else:
		G.gui.alert()
	

func action():
	if cast:
		cast.call('action')

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	G.player = self
	

func _input(e):
	if e is InputEventMouseMotion:
		rotation.y -= e.relative.x * SPEED_TURN
		$head.rotation.x  = clamp($head.rotation.x-e.relative.y * SPEED_TURN, -1.4, 1.4)
	
#	elif e is InputEventMouseButton:
#		if e.pressed:
#			$head/gun.fire()

	if Input.is_action_just_pressed("ui_get"):
		action()

func on_bullet():
	G.gui.on_bullet()
	G.hp -= 1
	if G.hp <= 0:
		G.reload()
		G.hp = 5
