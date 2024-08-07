extends Node2D

var nc = false
var nr = false
var stone_drop_count

func _process(delta):
	if nc == false:
		$Label.text = "x" + str(Objects.stone_drop_count + 1)
		$Rock.scale.x = 0.5; $Rock.scale.y = 0.5 
		nc = true
	if nr == false:
		stone_drop_count = Objects.stone_drop_count
		nr = true

func _on_area_2d_body_entered(body): #RECAP
	if body.name == "Player":
		queue_free()
		if stone_drop_count == 0:
			Resources.stone += 1
			print("+1 stone")
		elif stone_drop_count == 1:
			Resources.stone += 2
			print("+2 stone")
