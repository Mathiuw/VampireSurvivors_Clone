extends Area2D

func _physics_process(delta):
	var enemiesInRange = get_overlapping_bodies()
	if enemiesInRange.size() > 0:
		var enemyTarget = enemiesInRange.front() 
		look_at(enemyTarget.global_position)

func Shoot():
	const BULLET = preload("res://bullet.tscn")
	
	var new_Bullet = BULLET.instantiate()
	new_Bullet.global_position = %ShootPoint.global_position
	new_Bullet.global_rotation = %ShootPoint.global_rotation
	%ShootPoint.add_child(new_Bullet)

func _on_timer_timeout(): 
	Shoot()
