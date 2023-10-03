extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Soundtrack_Menu").play()
	pass # Replace with function body.

func _on_jugar_pressed():
	$VBoxContainer/jugar/AudioJugar.play()
	get_tree().change_scene_to_file("res://Escenas/ayuda.tscn")
	pass # Replace with function body.


func _on_créditos_pressed():
	$"VBoxContainer/Créditos/AudioCreditos".play
	get_tree().change_scene_to_file("res://Escenas/creditos.tscn")
	pass # Replace with function body.


func _on_salir_pressed():
	$VBoxContainer/Salir/AudioSalir.play()
	get_tree().quit()
	pass # Replace with function body.


func _on_configuración_pressed():
	$"VBoxContainer/Configuración/AudioConfiguracion".play()
	get_tree().change_scene_to_file("res://Escenas/configuracion.tscn")
	pass # Replace with function body.
