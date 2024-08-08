extends CharacterBody2D

var stands = true
var destantion = Vector2()
var speed = 50

func _process(delta):
	if velocity:
		move_and_slide()
		position.x = clamp(position.x, 0, 1000)
		position.y = clamp(position.y, 0, 1000)
	wander()

func set_distanse(dest):
	destantion = dest
	velocity = (destantion - position).normalized() * speed
	stands = false
	
func cancel_movement():
	velocity = Vector2()
	destantion = Vector2()
	$StopTimer.start(1)

func wander():
	var pos = position
	if stands:
		randomize()
		var x = int(randf_range(pos.x - 150, pos.x + 150))
		var y = int(randf_range(pos.y - 150, pos.y + 150))
		
		x = clamp(x, 0, 1000)
		y = clamp(y, 0, 1000)
		
		set_distanse(Vector2(x,y))
	elif velocity != Vector2():
		if position.distance_to(destantion) <= speed:
			cancel_movement()

func _on_stop_timer_timeout():
	stands = true
