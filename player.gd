extends CharacterBody2D
@export var speed: float = 300.0
var bullet_scene1= preload("res://bullet.tscn")

func _physics_process(delta):
	var suunta = Input.get_axis("ui_left", "ui_right")
	velocity.x = suunta * speed
	move_and_slide()
func _input(event):
	if event.is_action_pressed("ui_accept"):
		shoot()
			
		
func shoot():
	var bullet = bullet_scene1.instantiate()    
	bullet.global_position = global_position + Vector2(0, -30) 
	get_parent().add_child(bullet)

# Funktio, kun pelaajaan osuu
func take_damage():
	GameManager.take_damage(1)
