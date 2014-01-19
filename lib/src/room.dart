part of hipchat;

/**
 * A class abstracting the concept of a HipChat room.
 */
class HipChatRoom {
  // HipChat's unique ID for this room.
  int id;
  // The room's name, as it appears in the GUI.
  String roomName;
  // Various API links to things like the members list, webhooks list, etc.
  Map links;

  HipChatRoom(this.id, this.roomName, this.links);
  
  String toString() {
    return '<HipChatRoom: ${this.roomName}>';
  }
}