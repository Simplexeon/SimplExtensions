extends Node2D
class_name MenuManagerNode

# Export Vars
@export_file var TransitionPath : String = "";

# Object Vars
var TransitionPacked : PackedScene = null;
var SceneChangeTarget : String = "";
var viewport_rect : Vector2;

# Processes

func _ready() -> void:
	
	# Get Screen Size
	viewport_rect = Vector2(ProjectSettings.get_setting("display/window/size/viewport_width"), ProjectSettings.get_setting("display/window/size/viewport_height"));
	
	if(TransitionPath != ""):
		TransitionPacked = load(TransitionPath);

func _on_SceneChange(target_scene : String) -> void:
	SceneChangeTarget = target_scene;
	
	if(TransitionPacked != null):
		startTransition();
		return;
	
	changeScene();


# Functions

func changeScene() -> void:
	if(ResourceLoader.load_threaded_get_status(SceneChangeTarget) == ResourceLoader.THREAD_LOAD_LOADED):
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(SceneChangeTarget));

func startTransition() -> void:
	var Transition : Node2D = TransitionPacked.instantiate();
	Transition.global_position = viewport_rect / 2;
	add_child(Transition);
	Transition.connect("Finished", changeScene);
