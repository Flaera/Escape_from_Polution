extends Control


func _ready():
	pass#print("FUNCIOUNOU=", get_tree().paused)


func _process(_delta):
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_cancel")):
		get_tree().paused=false
		get_tree().change_scene("res://scenes/menu/menu.tscn")
