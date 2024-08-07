extends Node

var tsn : bool = true

var stone_x
var stone_y
var stone_max_count : int = 0
var stone_drop_count : int = 0

func _ready():
	if tsn == true:
		_create_stone()
		tsn = false

func _create_stone():
	if stone_max_count <= 10:
		var st = load("res://scene/stone.tscn")
		var stone = st.instantiate()
		var rng = RandomNumberGenerator.new()
		var x = rng.randi_range(0, 200)
		var y = rng.randi_range(0, 200)
		stone.position = Vector2(x,y)
		stone_x = x
		stone_y = y
		add_child(stone)
		stone_max_count += 1
	await get_tree().create_timer(10).timeout
	_create_stone()

func _stone_drop():
	var stdr = load("res://scene/stone_drop.tscn")
	var stonedr = stdr.instantiate()
	var rng = RandomNumberGenerator.new()
	var sdc = rng.randi_range(0, 1)
	stone_drop_count = sdc
	print(stone_drop_count)
	stonedr.position = Vector2(stone_x,stone_y)
	add_child(stonedr)
