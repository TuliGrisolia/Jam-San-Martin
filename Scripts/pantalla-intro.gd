extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Intro_Sonido").play()
	get_node("AnimationPlayer").play("Animación1")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name):
	pass # Replace with function body.
