@tool
extends Control


# Processes

func _ready() -> void:
	if(!Engine.is_editor_hint()):
		return;
	
	var viewport_rect : Vector2 = Vector2(ProjectSettings.get_setting("display/window/size/viewport_width"), ProjectSettings.get_setting("display/window/size/viewport_height"));
	size = viewport_rect;
