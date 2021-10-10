extends KinematicBody2D

export(Vector2) var velocity := Vector2(0,1)
export(bool) var smooth:bool = false

var oldPosition := Vector2.ZERO


func _ready() -> void:
	oldPosition = position
	if !smooth:
		$Sprite.modulate = Color.lightgreen



func _process(delta: float) -> void:
	if smooth:
		var fraction = Engine.get_physics_interpolation_fraction()
		$Sprite.global_position = oldPosition.linear_interpolate(global_position, fraction)


func _physics_process(delta: float) -> void:
	if smooth:
		oldPosition = position
		move_and_collide(velocity)
		if position.y > 656:
			position.y = 0-16
			oldPosition = position

	else:
		move_and_collide(velocity*delta*60)
		if position.y > 656: position.y = 0-16
