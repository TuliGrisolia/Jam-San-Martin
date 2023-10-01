extends Control

func update_score(snake_length):
	$textoscore.text = str(snake_length - 2)
	pass
