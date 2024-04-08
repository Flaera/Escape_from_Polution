extends Control


func _ready():
	get_node("HBoxContainer/ColorRect/play").grab_focus()


func _on_play_pressed():
	get_tree().change_scene("res://scenes/stage1/stage1.tscn")
	


func _on_quit_pressed():
	get_tree().quit()
