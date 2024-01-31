@tool
extends TextureRect

# Export Vars
@export var ScrollSpeed : float = 0;
@export var ScrollDirection : Vector2 = Vector2(1, 0) :
	set(value):
		ScrollDirection = value.normalized();
		#var reg_scroll : float = (viewport_rect.rotated(viewport_rect.angle_to(ScrollDirection)) * .5).length();
		#var texture_length : float = (texture.get_size() * ScrollDirection).length();
		#var texture_amount : float = reg_scroll / texture_length;
		#scroll_dir_max = texture_length * texture_amount;
		var a : float = texture.get_width() * scale.x;
		var b : float = abs(ScrollDirection.angle_to(Vector2(1, 0)));
		if(b > PI):
			b = b - PI;
		elif(b > (PI / 2)):
			b = b - (PI / 2);
		max_distance = a / (cos(b));

@export var Scale : float = 2.0 :
	set(value):
		Scale = value;
		scale = Vector2(1.0, 1.0) * value;
@export_group("Advanced")
@export var viewport_rect : Vector2;
@export var max_distance : float = 0.0;

# Object Vars
var distance_moved : Vector2 = Vector2.ZERO;


# Processes

func _ready() -> void:
	
	# Get Screen Size
	viewport_rect = Vector2(ProjectSettings.get_setting("display/window/size/viewport_width"), ProjectSettings.get_setting("display/window/size/viewport_height"));
	
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
	
	# Set Scroll Direction
	ScrollDirection = ScrollDirection;
	


func _physics_process(delta: float) -> void:
	if(ScrollSpeed == 0):
		return;
	var frame_change : Vector2 = ScrollDirection * ScrollSpeed * delta;
	position += frame_change;
	distance_moved += frame_change;
	#if(distance_moved.length() >= scroll_dir_max):
	#	position -= ScrollDirection * scroll_dir_max;
	#	distance_moved = distance_moved - (ScrollDirection * scroll_dir_max);
	
	if(distance_moved.length() >= max_distance):
		position -= ScrollDirection * max_distance;
		distance_moved -= ScrollDirection * max_distance;
