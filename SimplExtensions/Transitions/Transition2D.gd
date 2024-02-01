@tool
extends Node2D
class_name Transition2D

# Signals
signal Finished;

# Export Vars
@export var Effect : Transitions = Transitions.FadeToBlack;
@export_range(0.1, 10) var Speed : float = 1;
@export var Scale : float = 1 :
	set(value):
		Scale = value;
		if(viewport_rect != null):
			scale = viewport_rect * Scale;
@export var Reverse : bool = false;
@export var FreeOnEnd : bool = false;

# Enums
enum Transitions {
	FadeToBlack,
	Circle,
	ScreenWipe
}

# Object Vars
var time : float = 0.0;
var viewport_rect : Vector2;

# Component Vars
@onready var Sprite : Sprite2D = $Sprite2D;
@onready var SpriteMat : ShaderMaterial = Sprite.material;


# Processes

func _ready() -> void:
	
	# Set Size
	viewport_rect = get_viewport_rect().size;
	Scale = Scale;
	
	# Setup Reverse
	if(Reverse):
		Speed *= -1;
		time = 1.0;
		SpriteMat.set_shader_parameter("time", 1.0);
	
	# Setup Shader
	SpriteMat.set_shader_parameter("screen_size", viewport_rect);
	SpriteMat.set_shader_parameter("modulate", modulate);

func _physics_process(delta: float) -> void:
	time += delta * Speed;
	if(!Reverse):
		if(time >= 1):
			if(Engine.is_editor_hint()):
				time = 0.0;
				return;
			end();
	elif(time <= 0):
		if(Engine.is_editor_hint()):
			time = 1.0;
			return;
		end();
	
	if(SpriteMat != null):
		SpriteMat.set_shader_parameter("time", time);


# Functions

func end() -> void:
	Finished.emit();
	if(FreeOnEnd):
		queue_free();
