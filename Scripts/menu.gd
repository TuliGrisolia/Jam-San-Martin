extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Soundtrack_Menu").play()
	pass # Replace with function body.

func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://Escenas/ayuda.tscn")
	pass # Replace with function body.


func _on_créditos_pressed():
	get_tree().change_scene_to_file("res://Escenas/creditos.tscn")
	pass # Replace with function body.


func _on_salir_pressed():
	get_tree().quit()
	pass # Replace with function body.
