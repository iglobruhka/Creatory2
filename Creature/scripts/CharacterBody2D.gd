extends CharacterBody2D

class_name Player
@onready var animPlayr = $AnimationPlayer

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
