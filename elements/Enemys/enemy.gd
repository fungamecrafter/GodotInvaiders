extends CharacterBody2D

const ENEMY_BULLET_SCENE = preload("res://elements/enemy_bullet/enemy_bullet.tscn")

@onready var raycast_left := $RayCast2DLeft
@onready var raycast_right := $RayCast2DRight

func _physics_process(_delta):
	if raycast_left.is_colliding() or raycast_right.is_colliding():
		get_tree().call_group("enemy_group", "change_direction")

func destroy():
	Globals.change_points(1)
	Events.enemy_died.emit()
	queue_free()

func shot():
	var enemy_bullet = ENEMY_BULLET_SCENE.instantiate()
	enemy_bullet.global_position += global_position + Vector2(0, 10.0)
	add_child(enemy_bullet)
