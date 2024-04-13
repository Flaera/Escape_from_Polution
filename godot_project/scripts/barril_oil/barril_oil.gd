extends RigidBody


var fall: bool = false
const GRAVITY = 10
const FORCE_GRAV = 0.1


func _ready():
	gravity_scale=0.001


func _physics_process(_delta):
	if (fall==true):
		#add_force(Vector3(0,-FORCE_GRAV*_delta,0),translation)
		
		translation[1] = translation[1]-(FORCE_GRAV*GRAVITY*_delta)
		
	if (translation[1] >= 100):
		print("MORREU!")
		queue_free()


func _on_Area_body_entered(body):
	if (body.name=="player"):
		fall = true
