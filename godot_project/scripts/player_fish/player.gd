extends KinematicBody


var velocity: Vector3 = Vector3.ZERO
export var speed: int = 2
var died: bool = false
var scene_loser: Object = preload("res://scenes/ui_loser/ui_loser.tscn")


func _ready():
	
	get_node("Armature_fish/AnimationPlayer").play("idle")


func _physics_process(_delta):
	
	if (died==false):
		if (Input.is_action_pressed("ui_right")):
			velocity[0] = 1
			rotation_degrees.y = -90
		if (Input.is_action_pressed("ui_left")):
			velocity[0] = -1
			rotation_degrees.y = 90
		if (Input.is_action_pressed("ui_up")):
			velocity[1] = 1
		if (Input.is_action_pressed("ui_down")):
			velocity[1] = -1
		if (velocity[0]==-1 or velocity[0]==1 or velocity[1]==-1 or velocity[1]==1):
			get_node("Armature_fish/AnimationPlayer").play("idle")
		else:
			get_node("Armature_fish/AnimationPlayer").stop()
	
	move_and_slide(velocity*speed, Vector3.UP, true)
	velocity = Vector3.ZERO
	
	if (died==true and get_node("Armature_fish/AnimationPlayer").is_playing()==false):
		get_node("ui_loser").visible=true
		get_tree().paused=true


func _on_Area_body_entered(body):
	#print("body.name=",body.name)
	if (body.name[0]=="s" or body.name[0]=="b"):
		get_node("Armature_fish/AnimationPlayer").play("die")
		died = true
