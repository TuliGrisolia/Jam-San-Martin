extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Audio").play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Escenas/game.tscn")
	pass # Replace with function body.
