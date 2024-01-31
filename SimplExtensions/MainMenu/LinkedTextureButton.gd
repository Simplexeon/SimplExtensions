@tool
extends AutoTextureButton
class_name LinkedTextureButton

# Export Vars
@export var Link : String = "";
@export var Logo : Texture2D : 
	set(value):
		Logo = value;
		if(LogoTexture != null):
			LogoTexture.texture = value;

# Component Vars
@onready var LogoTexture : TextureRect = $CenterContainer/LogoTexture;


# Processes

func _ready() -> void:
	Text = Text;
	Scale = Scale;
	OffsetPosition = OffsetPosition;
	Logo = Logo;

func _on_pressed() -> void:
	OS.shell_open(Link);
