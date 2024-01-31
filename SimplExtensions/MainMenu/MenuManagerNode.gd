extends Node2D
class_name MenuManagerNode

# Export Vars
@export_file var TransitionPath : String = "";

# Object Vars
var TransitionPacked : PackedScene;
var SceneChangeTarget : String = "";

# Processes

func _ready() -> void:
	#TransitionPacked = load(TransitionPath);
	pass

func _physics_process(delta: float) -> void:
	if(SceneChangeTarget == ""):
		return;
	if(ResourceLoader.load_threaded_get_status(SceneChangeTarget) == ResourceLoader.THREAD_LOAD_LOADED):
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(SceneChangeTarget));

func _on_SceneChange(target_scene : String) -> void:
	SceneChangeTarget = target_scene;
