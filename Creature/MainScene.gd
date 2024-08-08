extends Node2D

func _physics_process(delta):
	if Input.is_action_just_pressed("click") and Resources.stone >= 5:
		Resources.stone -= 5
		var st = load("res://scene/kirka_2.tscn")
		var kirka2 = st.instantiate()
		add_child(kirka2)
