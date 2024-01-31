@tool
extends TextureRect

# Export Vars
@export var Scale : float = 1.0 :
	set(value):
		Scale = value;
		scale = Vector2(1.0, 1.0) * value;

# Processes

func _ready() -> void:
	
	# Get Screen Size
	var viewport_rect : Vector2 = Vector2(ProjectSettings.get_setting("display/window/size/viewport_width"), ProjectSettings.get_setting("display/window/size/viewport_height"));
	
	# Only in editor
	if(Engine.is_editor_hint()):
		# Set Anchors
		anchor_top = .5;
		anchor_bottom = .5;
		anchor_left = .5;
		anchor_right = .5;
		offset_top = 0;
		offset_bottom = 0;
		offset_left = 0;
		offset_right = 0;
		
		# Set Size
		size = viewport_rect;
		
		# Set Pivot Offset
		pivot_offset = size * .5;
		
		# Set Position
		position = Vector2.ZERO;
		
		# Reset Scale
		Scale = Scale;
