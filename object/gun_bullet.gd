extends KinematicBody

var vel

func _ready():
	vel = global_transform.basis.z.normalized() * -0.3

func _physics_process(delta):
#	vel.y -= 0.005
	var cld = move_and_collide(vel)
	if cld && cld.collider:
		if cld.collider.name != 'player':
			if cld.collider.has_method('on_bullet'):
				cld.collider.on_bullet()
		queue_free()

