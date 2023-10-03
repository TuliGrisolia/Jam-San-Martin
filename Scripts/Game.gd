extends Node

const SNAKE = 0
const FOOD = 2

var food_pos
var snake_body = [Vector2i(10,10), Vector2i(9,10), Vector2i(8,10)]
var snake_direction = Vector2i(1,0)

var snake_fruits_eaten = []

var adding_food = false

# Called when the node enters the scene tree for the first time.
func _ready():
	food_pos = def_pos_food()
	$Volver.hide()
	$Salir.hide()
	pass # Replace with function body.
	
func _process(delta):
	check_game_over()
	if food_pos in snake_body:
		food_pos = def_pos_food()
	pass
	
func _input(event):
	if Input.is_action_just_pressed("ui_up"):
		if not snake_direction == Vector2i(0,1):
			snake_direction = Vector2i(0,-1)
	if Input.is_action_just_pressed("ui_right"):
		if not snake_direction == Vector2i(-1,0):
			snake_direction = Vector2i(1,0)
	if Input.is_action_just_pressed("ui_left"):
		if not snake_direction == Vector2i(1,0):
			snake_direction = Vector2i(-1,0)
	if Input.is_action_just_pressed("ui_down"):
		if not snake_direction == Vector2i(0,-1):
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
	#for part in snake_body:
	#   $SnakeFood.set_cell(0, Vector2i(part.x, part.y), 0, Vector2i(0,0))
	for part_index in snake_body.size():
		var part = snake_body[part_index]
		
		if part_index == 0:
			$SnakeFood.set_cell(0, Vector2i(part.x, part.y), 0, Vector2i(0,0))
		else:
			if snake_fruits_eaten.has(snake_body[part_index]):
				$SnakeFood.set_cell(0, Vector2i(part.x, part.y), 3, Vector2i(0,0))
			else:
				$SnakeFood.set_cell(0, Vector2i(part.x, part.y), 0, Vector2i(1,0))
	pass
	
func move_snake():
	delete_tiles(SNAKE)
	var new_head = snake_body[0] + snake_direction
	snake_body.push_front(new_head)
	if snake_fruits_eaten.has(snake_body.back()):
		snake_fruits_eaten.erase(snake_body.back())
		
	else:
		snake_body.pop_back()
	pass
	
func check_food_eaten():
	if food_pos == snake_body[0]:
		snake_fruits_eaten.push_front(snake_body[0])
		food_pos = def_pos_food()
		adding_food = true
		$growing.play()
		get_tree(). call_group("ScoreGroup", "update_score", snake_body.size())
	pass
	
func check_game_over():
	var head = snake_body[0]
	# salir de la pantalla
	if head.x > 20 or head.x < 0 or head.y < 0 or head.y > 20:
		$impact.play()
		reset()
	# tocar su cuerpo
	for part in snake_body.slice(1, snake_body.size() - 1):
		if part == head:
			$impact.play()
			reset()
	pass
	
func reset():
	snake_body = [Vector2i(10,10), Vector2i(9,10), Vector2i(8,10)]
	snake_direction = Vector2i(1,0)
	get_tree(). call_group("ScoreGroup", "update_score", snake_body.size() - 1)
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
	check_food_eaten()
	pass # Replace with function body.


func _on_pausa_pressed():
	get_tree().paused = true
	$AudioPausa.play()
	$Pausa.hide()
	$Volver.show()
	$Salir.show()
	pass # Replace with function body.


func _on_volver_pressed():
	get_tree().paused = false
	$Volver.hide()
	$Pausa.show()
	pass # Replace with function body.


func _on_salir_pressed():
	get_tree().quit()
	pass # Replace with function body.
