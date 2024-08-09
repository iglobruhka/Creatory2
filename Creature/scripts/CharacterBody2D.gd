extends CharacterBody2D

class_name Player
var health = 20
@onready var animPlayr = $AnimationPlayer

func _ready():
	$ProgressBar.value = health
	$ProgressBar.visible = false



func _physics_process(delta):
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * 250
	move_and_slide()
	if Input.is_action_pressed("ui_left"):
		$Sprite2D.flip_h = true
		animPlayr.play("PlayerRun")
	if Input.is_action_pressed("ui_right"):
		$Sprite2D.flip_h = false
		animPlayr.play("PlayerRun")
	if Input.is_action_pressed("ui_up"):
		animPlayr.play("PlayerRun")
	if Input.is_action_pressed("ui_down"):
		animPlayr.play("PlayerRun")


func _on_hp_collider_body_entered(body):
	if body.name == "Enemy":
		_break()

func _break():
	$ProgressBar.visible = true
	health -= 4
	$ProgressBar.value = health
	if health <= 0:
		Resources.stone = 0
		get_tree().change_scene_to_file("res://scene/death.tscn")
	
