extends Node

const SNAKE = 0
const FOOD = 2

var food_pos
var snake_body = [Vector2i(10,10), Vector2i(9,10), Vector2i(8,10)]
var snake_direction = Vector2i(1,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	food_pos = def_pos_food()
	add_food()
	add_snake()
	pass # Replace with function body.
	
func _input(event):
	if Input.is_action_just_pressed("ui_up"):
		snake_direction = Vector2i(0,-1)
	if Input.is_action_just_pressed("ui_right"):
		snake_direction = Vector2i(1,0)
	if Input.is_action_just_pressed("ui_left"):
		snake_direction = Vector2i(-1,0)
	if Input.is_action_just_pressed("ui_down"):
		snake_direction = Vector2i(0,1)

func def_pos_food():
	randomize()
	var x = int(randf_range(0,19))
	var y = int(randf_range(0,19))
	return Vector2i(x,y)
	@warning_ignore("unreachable_code")
	pass
	
func add_food():
	$SnakeFood.set_cell(0, Vector2i(food_pos.x, food_pos.y), 2, Vector2i(0,0))
	pass

func add_snake():
	for part in snake_body:
		$SnakeFood.set_cell(0, Vector2i(part.x, part.y), 0, Vector2i(0,0))
	pass
	
func move_snake():
	delete_tiles(SNAKE)
	var body_copy = snake_body
	if snake_body.size() > 2:
		body_copy = snake_body.slice(0, snake_body.size() - 2)
	var new_head = body_copy[0] + snake_direction
	body_copy.insert(0, new_head)
	snake_body = body_copy
	pass
	
func delete_tiles(id:int):
	var cells = $SnakeFood.get_used_cells_by_id(id)
	for cell in cells:
		$SnakeFood.set_cell(0, Vector2i(cell.x, cell.y), 0, Vector2i(1,0), -1)
	pass

func _on_timer_timeout():
	move_snake()
	add_food()
	add_snake()
	pass # Replace with function body.
