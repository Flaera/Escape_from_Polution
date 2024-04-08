extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Camera").current = true


func camera_follow_player():
	var space_cam_player: int = 10
	var transl: Vector3 = Vector3(get_node("player").translation[0], get_node("player").translation[1], get_node("player").translation[2]+space_cam_player)
	get_node("Camera").translation=transl


func _physics_process(_delta):
	camera_follow_player()
