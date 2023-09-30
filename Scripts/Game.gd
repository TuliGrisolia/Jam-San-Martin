extends Node

const SNAKE = 0
const FOOD = 2

var food_pos

# Called when the node enters the scene tree for the first time.
func _ready():
	food_pos = def_pos_food()
	add_food()
	pass # Replace with function body.

func def_pos_food():
	randomize()
	var x = int(randi_range(0,19))
	var y = int(randi_range(0,19))
	return Vector2i(x,y)
	pass
	
func add_food():
	$SnakeFood.set_cell(0, Vector2i(food_pos.x, food_pos.y), 2, Vector2i(0,0))
	pass
