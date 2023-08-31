extends Spatial

export var limit_horizontal: Vector2 = Vector2(45, 45)
export var limit_vertical: Vector2 = Vector2(45, 10)
export var sensitivity: float = 0.005

var target_rot: Vector2
var smoothed_rot: Vector2

func _process(delta: float) -> void:
	var clamped_target: Vector2 = Vector2(
		clamp(target_rot.x, -deg2rad(limit_horizontal.x), deg2rad(limit_horizontal.y)),
		clamp(target_rot.y, -deg2rad(limit_vertical.x), deg2rad(limit_vertical.y))
	)
	target_rot = target_rot.linear_interpolate(clamped_target, 1.0 - pow(delta, 0.01))
	smoothed_rot = smoothed_rot.linear_interpolate(target_rot, 1.0 - pow(delta, 0.01))
	rotation.y = smoothed_rot.x
	rotation.x = smoothed_rot.y

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		target_rot.x -= event.relative.x * sensitivity
		target_rot.y -= event.relative.y * sensitivity
		target_rot.y = clamp(target_rot.y, -deg2rad(90), deg2rad(90))
