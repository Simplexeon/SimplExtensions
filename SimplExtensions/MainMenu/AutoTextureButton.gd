@tool
extends TextureButton
class_name AutoTextureButton

# Export Vars
@export var Text : String :
	set(value):
		Text = value;
		
		if(TextDisplay == null):
			return;
		
		TextDisplay.text = "[center]%s[/center]" % Text;
		TextDisplay.bbcode_enabled = true;
		TextDisplay.custom_minimum_size = Vector2(size.x, TextDisplay.get_content_height() + TextHeightModifier);

@export var Scale : float = 1.0 :
	set(value):
		
		# Set Scale
		scale = Vector2(1.0, 1.0) * value;
		Scale = value;
		
		# Set Position
		position = base_pos + OffsetPosition;
		
		# Set Anchors
		anchor_top = .5;
		anchor_bottom = .5;
		anchor_left = .5;
		anchor_right = .5;
		offset_top = 0;
		offset_bottom = 0;
		offset_left = 0;
		offset_right = 0;
		grow_horizontal = Control.GROW_DIRECTION_BOTH;
		grow_vertical = Control.GROW_DIRECTION_BOTH;
		
		# Set Pivot Offset
		pivot_offset = size * .5;
		
		# Update Text
		Text = Text;
		
		base_pos = position;
		

@export var OffsetPosition : Vector2 = Vector2.ZERO :
	set(value):
		OffsetPosition = value;
		
		# Reset base_pos
		Text = Text;
		
		position = base_pos + OffsetPosition;

@export var TextHeightModifier : float = 0.0 :
	set(value):
		TextHeightModifier = value;
		Text = Text;

@export_group("Advanced")
@export var base_pos : Vector2;


# Component Vars
@onready var TextDisplay : RichTextLabel = $CenterContainer/RichTextLabel;
@onready var Center : CenterContainer = $CenterContainer;


# Processes

func _ready() -> void:
	Text = Text;
	Scale = Scale;
	OffsetPosition = OffsetPosition;
	
