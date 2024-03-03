extends CharacterBody2D

signal healthDepleted

var health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right","move_up","move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
	
	const DAMAGE_RATE = 40.0
	var overlaping_mobs = %HitBox.get_overlapping_bodies()
	if overlaping_mobs.size() > 0:
		health -= (overlaping_mobs.size() * DAMAGE_RATE) * delta
		%HealthBar.value = health
		if health <= 0.0: 
			healthDepleted.emit()
