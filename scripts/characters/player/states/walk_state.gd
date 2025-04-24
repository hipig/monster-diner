extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@export var speed: int = 50

func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()
	
	var animate_direction :String
	var abs_x = abs(direction.x)
	var abs_y = abs(direction.y)
	if abs_x > abs_y:
		if direction.x > 0:
			animate_direction = "right"
		else:
			animate_direction = "left"
	elif abs_x < abs_y:
		if direction.y > 0:
			animate_direction = "down"
		else:
			animate_direction = "top"
				
	if direction != Vector2.ZERO:
		player.animate_direction = animate_direction
		animated_sprite_2d.play("walk_" + animate_direction)
	
	player.velocity = direction * speed
	player.move_and_slide()	

func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")
	
func _on_exit() -> void:
	animated_sprite_2d.stop()	
