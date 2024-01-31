@tool
extends TextureRect

# Export Vars
@export var CenterOffset : Vector2 = Vector2.ZERO :
	set(value):
		CenterOffset = value;
		if(Engine.is_editor_hint()):
			position = base_pos + CenterOffset;
@export var Scale : float = 1.0 :
	set(value):
		Scale = value;
		if(Engine.is_editor_hint()):
			scale = Vector2(Scale, Scale);

# Object Vars
var base_pos : Vector2 = Vector2.ZERO;


# Processes

func _ready() -> void:
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
		
		# Set Pivot Offset
		pivot_offset = size * .5;
		# Set Base Position
		base_pos = position;
		
		# Modify Position
		if(CenterOffset == null):
			CenterOffset = Vector2.ZERO;
		position = base_pos + CenterOffset;
	
	
	
