extends KinematicBody


var velocity: Vector3 = Vector3.ZERO
export var speed: int = 3
var died: bool = false
var stop: bool = false
var safing: int = 0
var scene_loser: Object = preload("res://scenes/ui_loser/ui_loser.tscn")
const ROTY_PLAYER = 5

func _ready():
	
	get_node("Armature_fish/AnimationPlayer").play("idle")


func _physics_process(_delta):
	
	if (died==false and stop==false):
		
		if (Input.is_action_pressed("ui_right")):
			velocity[0] = 1
			rotation_degrees.y=lerp(rotation_degrees.y,-90,ROTY_PLAYER*_delta)
		if (Input.is_action_pressed("ui_left")):
			velocity[0] = -1
			rotation_degrees.y=lerp(rotation_degrees.y,90,ROTY_PLAYER*_delta)
		#print("roty=", rotation_degrees.y)
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
		
	if (stop==true and safing==0):
		get_node("Armature_fish/AnimationPlayer").play("idle")
		get_node("Armature_fish/AnimationPlayer").play("safe")
		safing=1
	if (safing==1 and get_node("Armature_fish/AnimationPlayer").is_playing()==false):
		get_node("ui_winner").visible=true
		get_tree().paused=true


func _on_Area_body_entered(body):
	#print("body.name=",body.name)
	if (body.name[0]=="s" or body.name[0]=="b"):
		get_node("Armature_fish/AnimationPlayer").play("die")
		died = true


func _on_Area_area_entered(area):
	if (area.name=="Area_end_line"):
		stop=true
