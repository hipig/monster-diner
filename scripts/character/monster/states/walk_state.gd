extends Node

@export var monster: Monster
@export var animated_sprite_2d: AnimatedSprite2D
@export var navigation_agent_2d: NavigationAgent2D
@export var speed: int = 50

func _ready() -> void:
	navigation_agent_2d.velocity_computed.connect(on_safe_velocity_computed)

func set_movement_target(target_position: Vector2) -> void:
	navigation_agent_2d.target_position = target_position
	
func _on_physics_process(_delta : float) -> void:
	if navigation_agent_2d.is_navigation_finished():
		return
	
	var target_position: Vector2 = navigation_agent_2d.get_next_path_position()
	var target_direction: Vector2 = monster.global_position.direction_to(target_position)
	
	var velocity: Vector2 = target_direction * speed
	
	if navigation_agent_2d.avoidance_enabled:
		animated_sprite_2d.flip_h = velocity.x < 0
		navigation_agent_2d.velocity = velocity
	else:
		monster.velocity = velocity
		monster.move_and_slide()	
	
func on_safe_velocity_computed(safe_velocity: Vector2) -> void:
	monster.velocity = safe_velocity
	monster.move_and_slide()

func _on_next_transitions() -> void:
	pass

func _on_exit() -> void:
	animated_sprite_2d.stop()
