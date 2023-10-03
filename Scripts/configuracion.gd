extends Node2D

func _on_h_slidersonido_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sonido"), value)
	pass # Replace with function body.


func _on_h_sliderefectos_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Efectos"), value)
	pass # Replace with function body.


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Escenas/menu.tscn")
	pass # Replace with function body.
