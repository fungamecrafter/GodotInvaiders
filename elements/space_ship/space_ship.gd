extends CharacterBody2D


const SPEED = 300.0
const BULLET_SCENE = preload("res://elements/bullet/bullet.tscn")

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		shot()
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED

	move_and_slide()

func shot():
	var bullet = BULLET_SCENE.instantiate()
	bullet.global_position = global_position + Vector2(0, -13)
	add_child(bullet)

func take_damage():
	Globals.change_lives(-1)
