extends Node2D

# Export Vars
@export_file var TransitionPath : String = "";

# Object Vars
var TransitionPacked : PackedScene;


# Processes

func _ready() -> void:
	#TransitionPacked = load(TransitionPath);
	pass

func _on_SceneChange(target_scene : String) -> void:
	pass
