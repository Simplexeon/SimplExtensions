@tool
extends AutoTextureButton
class_name SceneTextureButton

# Export Vars
@export_file var TargetScene : String = "";


# Processes

func _ready() -> void:
	Text = Text;
	Scale = Scale;
	OffsetPosition = OffsetPosition;
	if(TargetScene != ""):
		ResourceLoader.load_threaded_request(TargetScene);

func _on_pressed() -> void:
	if(TargetScene != ""):
		get_tree().call_group("CSceneChange", "_on_SceneChange", TargetScene);
