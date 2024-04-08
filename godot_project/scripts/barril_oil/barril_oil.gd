extends RigidBody


var fall: bool = false
const GRAVITY = 10
const FORCE_GRAV = 10

func _process(_delta):
	if (fall==true):
		add_force(Vector3(0,-FORCE_GRAV*_delta,0),translation)
		#translation[1] = translation[1]-(GRAVITY*_delta)
		
	if (translation[1] <= 100):
		queue_free()


func _on_Area_body_entered(body):
	if (body.name=="player"):
		fall = true
