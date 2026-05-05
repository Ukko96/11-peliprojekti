extends CharacterBody2D

var speed = 200.0
var direction = 1 
var screen_width = 0

var bullet_scene = preload("res://enemy_bullet.tscn")
var shoot_timer = 0.0
var shoot_cooldown = 1.0

func _ready():
	screen_width = get_viewport_rect().size.x

func _physics_process(delta):
	velocity.x = speed * direction
	move_and_slide()
	
	if global_position.x > screen_width - 50 or global_position.x < 50:
		direction *= -1
	
	shoot_timer += delta
	if shoot_timer >= shoot_cooldown:
		shoot_timer = 0.0
		shoot()
		
		
func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = global_position
	get_parent().add_child(bullet)
