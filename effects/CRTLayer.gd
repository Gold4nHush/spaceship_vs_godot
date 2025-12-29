extends CanvasLayer

@onready var crt_rect = $ColorRect

var _crt_enabled: bool = true

var is_crt_enabled:
	get: return _crt_enabled

func toggle_crt() -> bool:
	_crt_enabled = !_crt_enabled
	_update_shader()
	return _crt_enabled

func _update_shader():
	if crt_rect.material != null:
		crt_rect.material.set_shader_parameter("enabled", _crt_enabled)
	else:
		push_warning("CRT material is not assigned to ", crt_rect.name)
