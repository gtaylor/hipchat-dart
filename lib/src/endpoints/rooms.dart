part of hipchat;

/**
 * API logic for the Rooms endpoint (/rooms).
 * 
 * This is separated out mostly for code brevity in hipchart.dart.
 */
class RoomEndpoint {
  
  /**
   * Retrieves a list (via a Future) of [HipChatRoom] instances 
   * representing all of the account's rooms.
   */
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

}