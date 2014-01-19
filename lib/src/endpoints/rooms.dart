part of hipchat;

/**
 * API logic for the Rooms endpoint (/rooms).
 * 
 * This is separated out mostly for code brevity in hipchart.dart.
 */
class RoomEndpoint {
  
  static Future<List> getRooms(HipChatClient client) {
    var completer = new Completer();
    http.get('${HipChatClient.API_URL}/room', headers : client._getHeaders())
      .then((response) {
        List<HipChatRoom> roomList = [];
        Map parsed = JSON.decode(response.body);
        // Each item is a room.
        parsed["items"].forEach((roomItem) {
          roomList.add(new HipChatRoom(
              roomItem['id'], 
              roomItem['name'], 
              roomItem['links']));
        });
        completer.complete(roomList);
      });
    return completer.future;
  }

  static Future sendRoomNotification(
      HipChatClient client, roomNameOrIdOrInstance, String message,
      String color, bool notify, String message_format) {
    // TODO: Raise an error if message length is < 0 or > 10000
    String roomName;
    if (roomNameOrIdOrInstance is HipChatRoom) {
      roomName = roomNameOrIdOrInstance.id;
    } else {
      roomName = roomNameOrIdOrInstance; 
    }
    
    String payloadJson = JSON.encode({
      'message': message,
      'color': color,
      'notify': notify,
      'message_format': message_format,
    });
    String apiUrl = '${HipChatClient.API_URL}/room/${roomName}/notification';
    
    var completer = new Completer();
    http.post(apiUrl, headers : client._getHeaders(), body : payloadJson)
      .then((response) {
        completer.complete();
      });
    
    return completer.future;
  }
  
  static Future createRoomn(HipChatClient client, roomName) {    
    Map payload = {
      'name': roomName,
    };
    String payloadJson = JSON.encode(payload);
    
    var completer = new Completer();
    http.post('${HipChatClient.API_URL}/room', 
        headers : client._getHeaders(),
        body : payloadJson)
      .then((response) {
        print("RESPONSE");
        print(response.body);
        completer.complete("TESTING");
      });
    
    return completer.future;
  }
  
}