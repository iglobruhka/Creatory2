extends Node2D

class_name Stone

var stone_pos_x
var stone_pos_y
var max_health : int = 20
var health : int = 20
var playerIn : bool = false
var readyToBreak : bool = false
@onready var audioBreak = $BreakAudio #Сюда нужен аудио плэйр в котором есть музыка

func _ready():
	$ProgressBar.value = health
	$ProgressBar.visible = false
	stone_pos_x = Objects.stone_x
	stone_pos_y = Objects.stone_y
	$Rock.material.set("shader_param/width", 0)

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		playerIn = true

func _on_area_2d_body_exited(body):
	if body.name == "Player":
		playerIn = false

func _on_area_2d_mouse_entered():
	readyToBreak = true
	$ProgressBar.visible = true
	$Rock.material.set("shader_param/width", 1)

func _on_area_2d_mouse_exited():
	readyToBreak = false
	$ProgressBar.visible = false
	$Rock.material.set("shader_param/width", 0)

func _process(_delta):
	if Input.is_action_just_pressed("click"):
		if readyToBreak == true and playerIn == true:
			_break()

func _break():
	health -= 5
	audioBreak.play()
	$ProgressBar.value = health
	if health <= 0:
		queue_free()
		Objects.stone_max_count -= 1
		Objects.stone_x = stone_pos_x
		Objects.stone_y = stone_pos_y
		Objects._stone_drop()
	if health < max_health:
		await get_tree().create_timer(30).timeout
		health = max_health
		$ProgressBar.value = health
