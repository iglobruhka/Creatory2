extends ProgressBar

@onready var timer = $Timer
@onready var damage_bar = $DamageBar

var healts = 0 : set = _set_healts

func _set_healts(new_healts):
	var prev_healts = healts
	healts = min(max_value, new_healts)
	value = healts
	
	if healts <= 0:
		queue_free()
	#if healts < prev_healts:
		#timer.start()
	else:
		damage_bar.value = healts


func init_health(_health):
	healts = _health
	max_value = healts
	value = healts
	damage_bar.max_value = healts
	damage_bar.value = healts

#func _on_timer_timeout():
	#damage_bar.value = healts
