extends Control

onready var global = get_node("/root/Global")
onready var HUD = get_node("/root/Game/HUD")

func ready():
	update_score(0)

func update_score(s):
	global.score += s
	$Score.text = "Your Score Was: " + str(global.score)


func _on_Play_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_Quit_pressed():
	get_tree().quit()
