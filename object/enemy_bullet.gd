extends KinematicBody

var vel

func _ready():
	look_at(G.camera.global_transform.origin, Vector3.UP)
	vel = global_transform.basis.z.normalized() * -0.4

func _physics_process(delta):
#	vel.y -= 0.005
	var cld = move_and_collide(vel)
	if cld && cld.collider:
		if cld.collider.has_method('on_bullet'):
			cld.collider.on_bullet()
		queue_free()
