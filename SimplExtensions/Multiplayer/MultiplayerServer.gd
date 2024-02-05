extends Node
class_name MultiplayerServer

# Export Vars
@export var Port : int = 33837;
@export_range(0, 4095) var MaxClients : int = 32;


# Processes

func _on_CreationError() -> void:
	pass

func _on_ClientConnected(clientId : int) -> void:
	pass

func _on_ClientDisconnected(clientId : int) -> void:
	pass


#  Functions

func startServer() -> void:
	var multiplayerPeer : ENetMultiplayerPeer = ENetMultiplayerPeer.new();
	var error : Error = multiplayerPeer.create_server(Port, MaxClients);
	if(error):
		_on_CreationError();
		return;
	multiplayer.multiplayer_peer = multiplayerPeer;
	multiplayer.connect("peer_connected", _on_ClientConnected);
	multiplayer.connect("peer_disconnected", _on_ClientDisconnected);

func stopServer() -> void:
	multiplayer.multiplayer_peer = null;
