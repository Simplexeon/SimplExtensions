extends Node
class_name MultiplayerClient

# Export Vars
@export var Ip : String = "127.0.0.1";
@export var Port : int = 33837;


# Processes

func _on_ConnectionError() -> void:
	pass

func _on_ConnectedToServer() -> void:
	pass

func _on_ConnectionFailed() -> void:
	pass

func _on_ClientConnected(clientId : int) -> void:
	pass

func _on_ClientDisconnected(clientId : int) -> void:
	pass

func _on_ServerDisconnected() -> void:
	pass

#  Functions

func connectToServer() -> void:
	var multiplayerPeer : ENetMultiplayerPeer = ENetMultiplayerPeer.new();
	var error : Error = multiplayerPeer.create_client(Ip, Port);
	if(error):
		_on_ConnectionError();
		return;
	multiplayer.multiplayer_peer = multiplayerPeer;
	multiplayer.connect("peer_connected", _on_ClientConnected);
	multiplayer.connect("peer_disconnected", _on_ClientDisconnected);

func disconnectFromServer() -> void:
	multiplayer.multiplayer_peer = null;
