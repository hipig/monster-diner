extends NodeState

@export var monster: Monster
@export var animated_sprite_2d: AnimatedSprite2D

func _on_physics_process(_delta : float) -> void:
	animated_sprite_2d.play("idle_" + monster.animate_direction)

func _on_next_transitions() -> void:
	pass
	
func _on_exit() -> void:
	animated_sprite_2d.stop()
