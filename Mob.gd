extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")

var health = 2

func _ready():
	%Slime.play_walk

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 450
	move_and_slide()

func take_damage():
	health -= 1
	%Slime.play_hurt()
	if health <= 0:
		const EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")
		var new_Explosion = EXPLOSION.instantiate()
		get_parent().add_child(new_Explosion)
		new_Explosion.global_position = %Slime.global_position
		queue_free()
